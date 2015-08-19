class Api::SecretAdmirersController < ApplicationController
  def index
    @secret_admirers = current_user.secret_admirers
  end
end
