Rails.application.routes.draw do
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
