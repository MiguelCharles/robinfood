Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'promotions#index'
resources :users, except: [:index]

resources :shops
resources :promotions do
 post 'add_to_order', to: 'add_to_order#promotions', on: :member
end
  resources :orders
end
