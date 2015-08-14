class Api::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    @details = DetailsOfUser.new(details_params)
    @details.user = @user

    @responses = response_categories.map do |c|
      Response.new({
        user: @user,
        body: response_params[c.id.to_s],
        response_category_id: c.id
      })
    end

    # Check that all the models are valid before
    # committing to the database.  The DB has validations
    # but those are our last line of defense.
    messages = []
    models = [@user, @details] + @responses
    models.each do |model|
      model.valid?
      messages.concat(model.errors.full_messages)
    end

    if messages.empty?
      ActiveRecord::Base.transaction do
        @user.save!
        @details.save!
        @responses.each do |response|
          response.save!
        end
      end

      sign_in @user
      redirect_to root_url

    else
      fetch_dropdown_items
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

  def response_params
    @response_params ||= params.require(:response)
  end

  def fetch_dropdown_items
    @genders ||= Gender.all
    @religions ||= Religion.all
    @body_types ||= BodyType.all
    @ethnicities ||= Ethnicity.all
    @relationship_statuses ||= RelationshipStatus.all
    response_categories
  end

  def response_categories
    @response_categories ||= ResponseCategory.all
  end

end
