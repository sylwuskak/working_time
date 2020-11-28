class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path
  end

  def show
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:salary, :hours_number, :hours_by_month)
  end
end