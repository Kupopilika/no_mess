Rails.application.routes.draw do

  get 'favorites/index'
  get 'ingredients/expiration', to: 'ingredients#expiration', :defaults => { :format => 'json' }

  devise_for :users
  root to: 'pages#home'
  get 'pages/message_show_empty'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_ingredients

  resources :recipes do
    resources :recipe_ingredients
  end

  resources :favorites, only: [:index, :create, :destroy]
end
