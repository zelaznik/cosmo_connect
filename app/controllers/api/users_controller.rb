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
    if @user != current_user
      raise Exception("Cannot change the attributes of another user.")
    end

    ## Save the details in the main user table
    model = @user
    model.update! user_params_main

    ## Save the user's gender preferences
    interested_in = user_interested_in
    unless interested_in.empty?
      ActiveRecord::Base.transaction do
        DesiredGender.where(user: @user).each do |d|
          d.interested = interested_in.include?(d.gender_id)
          model = d
          d.save!
        end
      end
    end

    ## Save the user's other details, stored in a second table.
    details = user_params_details
    unless details.empty?
      model = current_user.details
      model.update! details
    end

    @exclude_blank_responses = true
    render :show

  end

  def index
    @users = current_user.matches_by_orientation.order(created_at: :desc)
  end

  private
  def user_params_all
    d = params.require(:user).permit(
      ## User Details Table
      :religion_id, :ethnicity_id, :height, :body_type_id,
      :relationship_status_id, :religion_id, :zip_code,
      ## Main Users Table
      :id, :gender_id, :min_age, :max_age, birthdate: [:year, :month, :day])
  end

  def user_params_subset(*keys)
    dct = {}
    m = user_params_all
    keys.each do |k|
      dct[k] = m[k] if m.include?(k)
    end
    dct
  end

  def user_params_main
    d = user_params_subset(:id, :gender_id, :min_age, :max_age, :birthdate)
    if d[:birthdate]
      b = d[:birthdate]
      d[:birthdate] = Date.new(b[:year].to_i, b[:month].to_i, b[:day].to_i)
    end
    d
  end

  def user_params_details
    user_params_subset(:religion_id, :ethnicity_id, :height, :body_type_id,
    :relationship_status_id, :religion_id, :zip_code)
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
