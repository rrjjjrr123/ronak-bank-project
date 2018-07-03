class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource) 
  end

  def after_inactive_sign_up_path_for(resource)
    "/users/password/new"
  end
end