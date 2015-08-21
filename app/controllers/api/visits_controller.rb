class Api::VisitsController < Api::BaseController
  def show
    #This is actually a hijacked index view.
    m = params[:id].downcase
    case m
    when 'sent'
        @users = current_user.visited_profiles
      when 'received'
        @users = current_user.visitors
      else
        render json: ["Unsupported method: '#{m}'"], status: 422
    end
  end
end
