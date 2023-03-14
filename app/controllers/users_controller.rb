class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find(current_user.id)
  end

end
