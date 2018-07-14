  Rails.application.routes.draw do
  
<<<<<<< HEAD
  devise_for :sellers   
  resources :sellers
  get '/sellers', to: 'sellers#index'
=======
  devise_for :sellers 

  devise_scope :seller do
   # custom path to login/sign_in
    get 'sign_up', to: 'devise/registrations#new'
     # custom path to sign_up/registration
  end
  resources :sellers
  get '/sellers', to: 'sellers#show'
>>>>>>> 07e072873bb9a5a81f41dbb145d4e87de7b0c867

  get 'regristations/regristations'

  # devise_for :users 
     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/sign_up', to: 'devise/sessions#new'
  root'users#show'

  devise_for :users,controllers: {registrations: "registrations"}  
  resources :admins do
    member do
      post 'approve'
      post 'manager'
    end
  end 

  scope'admin' do 
    resources :users do
      resources :bank_accounts do
        collection do
          get 'amount_transfer'
          patch 'transfer'
          get 'otp_generator'
          post 'otp_update'
        end  
      end
    end
  end  
<<<<<<< HEAD
  
=======


>>>>>>> 07e072873bb9a5a81f41dbb145d4e87de7b0c867
  resources :beneficiaries
end  