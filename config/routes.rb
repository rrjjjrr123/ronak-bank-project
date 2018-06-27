Rails.application.routes.draw do
  
  get 'regristations/regristations'

  # devise_for :users 
     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/sign_up', to: 'devise/sessions#new'
  root'users#show' 
  devise_for :users   
  
  resources :admins do
    member do
      post 'approve'
    end
  end

  resources :users do
    resources :bank_accounts do
      collection do
        get 'amount_transfer'
        patch 'transfer'
      end  
    end
  end
  resources :beneficiaries
end  