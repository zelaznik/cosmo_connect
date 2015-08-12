class UsersController < ApplicationController
  def new
    @user = User.new
    fetch_dropdown_items
  end

  def create
    @user = User.new(user_params)
    @details = DetailsOfUser.new(details_params)

    msgs = []
    err_raised = false
    if @user.save
      @details.user_id = @user.id
      if not @details.save
        err_raised = true
        msgs += @details.errors.full_messages
      end
    else
      err_raised = true
      msgs += @user.errors.full_messages
    end

    if not err_raised
      sign_in(@user)
      redirect_to root_url
    else
      fetch_dropdown_items
      flash.now[:errors] = @user.errors.full_messages
      flash.now[:errors] += @details.errors.full_messages
      render :new
    end

  end

  private
  def user_params
    params
      .require(:user)
      .permit(:username, :password, :birthdate,:gender_id)
  end

  def details_params
    params.require(:user).permit(:ethnicity_id,
    :body_type_id, :relationship_status_id, :religion_id)
  end

  def fetch_dropdown_items
    @genders = Gender.all
    @religions = Religion.all
    @body_types = BodyType.all
    @ethnicities = Ethnicity.all
    @relationship_statuses = RelationshipStatus.all
  end

end
