class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
     # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_no, :dob, :email, :password])
  end

  before_filter :authenticate_user!
end



  
