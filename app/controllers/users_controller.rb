class UsersController < ApplicationController
  include LoginHelper

  def new
    @user = User.new
  end

  def create
    user_signup
  end

  def destroy
    session.delete :user_id

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_digest)
  end
end
