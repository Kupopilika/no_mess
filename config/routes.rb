Rails.application.routes.draw do

  get 'favorites/index'
  get 'ingredients/expiration', to: 'ingredients#expiration', :defaults => { :format => 'json' }
  get 'ingredients/units', to: 'ingredients#units', :defaults => { :format => 'json' }

  devise_for :users
  root to: 'pages#home'
  get 'pages/message_show_empty'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'user_ingredients/product', to: 'user_ingredients#product'
  resources :user_ingredients


  resources :ingredients, only: :create

  resources :recipes do
    resources :recipe_ingredients
    patch 'user_ingredients_update', to: 'recipes#user_ingredients_update'
  end

  resources :favorites, only: [:index, :create, :destroy]
end
