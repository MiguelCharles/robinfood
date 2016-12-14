Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'promotions#index'
resources :users, except: [:index] do
end

resources :shops do
  get 'promotions', to: 'shops#promotions'
  put 'activation', to: 'shops#changestatus'
end
resources :promotions do
 post 'add_to_order', to: 'add_to_order#promotions', on: :member
end
  resources :orders do
    post 'confirm', on: :member
  end
end
