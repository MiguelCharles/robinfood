Rails.application.routes.draw do

  devise_for :users
  get 'orders/index'

  get 'orders/show'

  get 'orders/new'

  get 'orders/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'promotions#index'
resources :users, except: [:index]
resources :shops
resources :promotions
 do post 'add_to_order', to: 'add_to_order#promotions', on: :member
end
  resources :orders
end
