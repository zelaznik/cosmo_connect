class Api::CrushesController < ApplicationController
  def index
    @crushes = current_user.crushes
  end
end
