Rails.application.routes.draw do
  
  get 'regristations/regristations'

  # devise_for :users 
     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/sign_up', to: 'devise/sessions#new'
  root'users#show'  

  devise_for :users,
    controllers: {registrations: "registrations"}
  as :user do
    get "/register", to: "registrations#new", as: "register"
  end

  resources :admins do
    member do
      post 'approve'
      post 'manager'
    end
  end

  resources :users do
    resources :bank_accounts do
      collection do
        get 'amount_transfer'
        patch 'transfer'
        get 'otp_generator'
        post 'otp_update'
      end  
    end
    get 'set_password'
  end
  resources :beneficiaries
end  