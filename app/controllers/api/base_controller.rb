class Api::BaseController < ApplicationController
  before_action :redirect_if_not_signed_in
end
