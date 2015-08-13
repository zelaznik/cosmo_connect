class UsersController < ApplicationController
  def new
    @user = User.new
    fetch_dropdown_items
  end

  def create
    @user = User.new(user_params)
    @details = DetailsOfUser.new(details_params)
    #@responses = Response.new(response_params)

    messages = []
    [@user, @details].each do |tbl|
      tbl.valid?
      messages.concat(tbl.errors.full_messages)
    end

    if messages.empty?
      ActiveRecord::Base.transaction do
        @user.save!
        @details.user_id = @user.id
        @details.save!
      end

      sign_in @user
      redirect_to root_url

    else
      flash.now[:errors] = messages
      render :new, status: 422

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

  def responses
    response_hash = params.require(:response)
  end

  def fetch_dropdown_items
    @genders = Gender.all
    @religions = Religion.all
    @body_types = BodyType.all
    @ethnicities = Ethnicity.all
    @relationship_statuses = RelationshipStatus.all

    @response_categories = ResponseCategory.all
  end

end
