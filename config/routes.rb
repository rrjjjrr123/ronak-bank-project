  Rails.application.routes.draw do
 
  devise_for :sellers  
  resources :sellers
     
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'users/sign_up', to: 'devise/sessions#new'
  
  devise_scope :seller do
    get '/login', to: 'devise/sessions#create'
  end  
  
  root'items#index' 
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
    resources :orders
  end    
 
  resources :users do
    collection do 
      get 'account_details'
      get 'profile'
    end
    resources :orders do
      collection do
        get 'veiw_order'
      end
      resources :bank_accounts do
        collection do
          get 'amount_transfer'
          patch 'transfer' 
          post 'otp_confirmation'
        end  
      end
    end  
  end 
end  