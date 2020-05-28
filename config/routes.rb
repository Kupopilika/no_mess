Rails.application.routes.draw do
  get 'favorites/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :user_ingredients
  resources :recipes do
    resources :recipe_ingredients
  end

  resources :favorites, only: [:index, :create, :destroy]
end
