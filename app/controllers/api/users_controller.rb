class Api::UsersController < Api::BaseController
  before_action :ensure_current_user, only: [:update]

  def show
    @user = User.find(params[:id])
    log_visit(@user) unless @user == current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @exclude_blank_responses = true
      render :show
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def index
    @users = User.all
  end

  private
  def user_params
    dct = params.require(:user).permit(:gender_id, :birthdate)
    bday = params[:birthdate]
    begin
      dct[:birthdate] = Date.new(bday[:year].to_i, bday[:month].to_i, bday[:day].to_i)
    rescue ArgumentError
      #pass
    end
    return dct
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
