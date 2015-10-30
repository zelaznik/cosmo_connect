class Api::UsersController < Api::BaseController
  before_action :ensure_current_user, only: [:update]

  def show
    if (params[:id].to_i > 0)
      @user = User.find(params[:id])
    else
      @user = User.find_by(username: params[:id])
    end
    log_visit(@user) unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    interested_in = user_interested_in
    if @user.update(user_params_main)
      @exclude_blank_responses = true
      unless interested_in.empty?
        ActiveRecord::Base.transaction do
          DesiredGender.where(user: @user).each do |d|
            d.interested = interested_in.include?(d.gender_id)
            d.save!
          end
        end
      end
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def index
    @users = current_user.matches_by_orientation.order(created_at: :desc)
  end

  private
  def user_params_main
    dct = params.require(:user).permit(:id, :gender_id, :min_age, :max_age, birthdate: [:year, :month, :day])
    bday = dct[:birthdate]
    begin
      dct[:birthdate] = Date.new(bday[:year].to_i, bday[:month].to_i, bday[:day].to_i)
    rescue ArgumentError
      #pass
    end
    return dct
  end

  def user_interested_in
    dct = params.require(:user).permit(interested_in: [])
    (dct[:interested_in]) ? dct[:interested_in].map(&:to_i) : []
  end

  def ensure_current_user
    if params[:id].to_i != current_user.id
      raise "Cannot modify attributes of another user."
    end
  end

  def log_visit(other_user)
    # Either enters a new visit record into the database,
    # or updates an existing record to reflect the most recent visit.
    h = {visitor: current_user, profile: other_user}
    @visit = Visit.where(h).first || Visit.new
    @visit.update(h)
    @visit.save!
  end

end
