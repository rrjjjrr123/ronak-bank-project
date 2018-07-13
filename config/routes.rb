Rails.application.routes.draw do
  
  devise_for :sellers 

  resources :sellers
  
  get '/seller', to: 'sellers#show'

  # devise_for :users 
     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/sign_up', to: 'devise/sessions#new'
  root'items#index'
  resources :orders 
  devise_for :users  
  resources :admins do
    member do
      post 'approve'
      post 'manager'
    end
  end 


  scope'seller' do
    resources :items do   
    end  
  end

  resources :items do   
    member do
      get 'purchase_item'
      get 'confirm_order'
    end
  end    
 
  resources :users do
    resources :order do 
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


  resources :beneficiaries
end  