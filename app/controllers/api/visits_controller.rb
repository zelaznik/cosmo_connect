class Api::VisitsController < Api::BaseController
  def show
    #This is actually a hijacked index view.
    m = params[:id].downcase
    case m
      when 'browsing_history'
        @users = current_user.crushes
      when 'your_visitors'
        @users = current_user.secret_admirers
      else
        render json: ["Unsupported method: '#{m}'"], status: 422
    end
  end
end
