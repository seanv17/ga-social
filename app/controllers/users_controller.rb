class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    set_user
    @user.update_attributes(user_params)
    flash[:notice] = "User info updated!"
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :current_city, :current_postion, :current_employer, :seeking_work, :tech_preference, :email, :avatar)
  end

  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

end
