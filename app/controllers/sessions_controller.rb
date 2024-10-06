# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_dashboard(user)
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out successfully."
  end

  private

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