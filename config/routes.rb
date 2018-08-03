Rails.application.routes.draw do
  
  mount_devise_token_auth_for 'User', at: 'auth'
  mount_devise_token_auth_for 'Seller', at: 'auth'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do                  
      devise_for :users
      devise_for :sellers          
      
      scope'seller' do
        resources :items, only: [:index, :new, :create]      
      end

      resources :sellers,only: [:index, :show]

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
end  
  