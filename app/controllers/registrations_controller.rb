class RegistrationsController < Devise::RegistrationsController

  prepend_before_action :require_no_authentication, only: [:new]  
  skip_before_action :require_no_authentication, only: [:new,:create]

  protected     
  
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)    
  end

  def after_sign_in_path_for(resource)
  end

  def after_sign_up_path_for(resource)
    new_user_session_path 
  end

  def after_inactive_sign_up_path_for(resource)
    root_path
  end
end