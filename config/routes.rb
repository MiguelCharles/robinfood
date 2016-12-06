Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'promotions#index'
resources :users, except: [:index]
resources :shops
resources :promotions
end
