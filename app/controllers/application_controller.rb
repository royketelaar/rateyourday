class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?
  
  private
  
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :birthday, :gender, :education, :employment, :section, :function, :management, :employees, :hours_week, :salary, :work_location, :place, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :last_name, :birthday, :gender, :education, :employment, :section, :function, :management, :employees, :hours_week, :salary, :work_location, :place, :email, :password, :password_confirmation, :current_password)
    end
  end
  
end