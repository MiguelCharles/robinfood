Rails.application.routes.draw do

    ActiveAdmin.routes(self)
    get 'pages/index'
    get 'pages/about'

    devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

    post "/filtered_promo" => 'promotions#index'

    scope '(:locale)', locale: /fr|en/ do  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

        root to: 'pages#index'
        resources :users, only: [:show, :edit, :update] # User Profile page, the rest is handeld by Devise
        get 'change_language/:language' => 'application_controller#change_language', as: 'change_language'
        resources :shops do
          get 'promotions', to: 'shops#promotions'
          put 'activation', to: 'shops#changestatus'
        end
        resources :promotions do
         post 'add_to_order', to: 'add_to_order#promotions', on: :member
         post 'filtered', to: 'promotions#index'
        end
        resources :orders do
        post 'confirm', on: :member
        end

    end
end
