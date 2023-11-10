class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
      @user = current_user
      @user.destroy
      redirect_to root_path, notice: 'Your account has been deleted.'
  end
end