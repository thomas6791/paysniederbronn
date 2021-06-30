class OwnersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @annonces = @user.rentings
  end
end
