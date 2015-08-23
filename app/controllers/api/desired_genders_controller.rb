class Api::DesiredGendersController < Api::BaseController
  def create
    @desired_gender = DesiredGender.new(desired_genders_params)
    @desired_gender.user = current_user
    if @desired_gender.save
      render json: @desired_gender
    else
      render json: @desired_gender.errors.full_messages, status: 422
    end
  end

  def destroy
    @desired_gender = DesiredGender.find(params[:id])
    if @desired_gender.sender == current_user
      @desired_gender.destroy
      render json: {}
    else
      render json: ['Cannot modify the preferences of another user'], status: 422
    end
  end

  private
  def desired_genders_params
    params.require(:desired_gender).permit(:gender_id)
  end
end
