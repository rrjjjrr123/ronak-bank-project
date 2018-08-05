Rails.application.routes.draw do
  devise_for :users
  devise_for :sellers

  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :accounts do
      collection do
        post 'transfer'
        post 'otp_confirmation'
      end
    end

    resources :items do
      collection do
        get 'purchase_item'
      end
    end

    resources :orders do
      collection do
        get 'veiw_order'
      end
    end
  end
end
