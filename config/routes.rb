Rails.application.routes.draw do
 
  devise_for :users
  devise_for :sellers

  root 'items#index'
  resources :sellers    
  resources :charges 
  scope'seller' do
    resources :items ,only: [:new]do   
    end  
  end

  resources :items do   
    member do
      get 'purchase_item'
    end
    resources :orders
  end
 
  resources :users do
    collection do 
      get 'profile'
    end

    resources :bank_accounts do
      collection do
        get'amount_transfer'
        post 'transfer'
        post 'otp_confirmation'
      end
    end  
    resources :orders do
      collection do
        get 'veiw_order'
      end
    end
  end
end
