# this is the base controller
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,
    :father_name, :mother_name, :father_occupation, :full_name,
    :confirmed, :image, :mother_occupation, :phone_no, :user_type,
    addresses_attributes: [:id, :permanent, :country, :state, :city,
                           :area, :house_no, :street_no, :pin,
                           :address_proof, :_destroy]
    ])
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
