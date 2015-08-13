class StaticPagesController < ApplicationController
  before_action :redirect_if_not_signed_in

  def root
  end

end
