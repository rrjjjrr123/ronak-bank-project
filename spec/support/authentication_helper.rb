module AuthenticationHelper

  def authenticate_user user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.headers.merge! user.create_new_auth_token
    sign_in user
  end

  def authenticate_seller seller
    @request.env["devise.mapping"] = Devise.mappings[:seller]
    @request.headers.merge! seller.create_new_auth_token
    sign_in seller
  end
end