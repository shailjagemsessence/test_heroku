  class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def send_request_mail
  #   @user = User.all
  # end

  protected

  def configure_permitted_parameters
    if  user_signed_in?   
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :contact_no, :dob, :email, :password, :image])
    else  
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_no, :dob, :email, :password, :image])
    end
  end
end
  

  

  




  
