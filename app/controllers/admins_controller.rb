# app/controllers/admins_controller.rb
class AdminsController < ApplicationController
  def dashboard
    @users = User.all
  end

  def edit_role
    @user = User.find(params[:id])
  end

  def update_role
    @user = User.find(params[:id])
    if @user.update(role_params)
      redirect_to admins_dashboard_path, notice: 'User role updated successfully.'
    else
      render :edit_role
    end
  end

  private

  def role_params
    params.require(:user).permit(:role)
  end
end
