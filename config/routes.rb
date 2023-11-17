Rails.application.routes.draw do
  resources :dinners
  resources :categories
  get 'recipies/new'
  get 'recipies/create'
  get 'recipies/edit'
  get 'recipies/update'
  get 'recipies/destroy'
  devise_for :users
  
  authenticated :user do
    root 'recipes#index', as: :authenticated_root
  end

  root to: "home#index"
  get "recipes", to: "recipes#index"
  get "/", to: "home#index"
  resources :recipes

end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
