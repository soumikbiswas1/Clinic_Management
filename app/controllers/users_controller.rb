# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new(role: :receptionist)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to_dashboard(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def redirect_to_dashboard(user)
    case user.role
    when "receptionist"
      redirect_to receptionist_dashboard_path
    when "doctor"
      redirect_to doctor_dashboard_path
    when "admin"
      redirect_to admins_dashboard_path
    else
      redirect_to root_path
    end
  end
end