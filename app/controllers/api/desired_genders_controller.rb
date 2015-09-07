class Api::DesiredGendersController < Api::BaseController
  def show
    @desired_gender = DesiredGender.find(params[:id])
    render json: @desired_gender
  end

  def update
    @desired_gender = DesiredGender.find(params[:id])
    if @desired_gender.update(desired_genders_params)
      render :show
    else
      render json: @desired_gender.errors.full_messages, status: 422
    end
  end

  private
  def desired_genders_params
    params.require(:desired_gender).permit(:gender_id, :interested)
  end
end
