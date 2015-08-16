class Api::ResponsesController < ApplicationController
  def update
    raise "Zelaznik is awesome!"
  end

  private
  def response_params
    params.require(:response).permit()
  end

end
