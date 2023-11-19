Rails.application.routes.draw do
  #resources :dinners
  resources :categories
  get 'recipies/new', to: 'recipes#new', as: :new_recipe
  get 'recipies/create'
  get 'recipies/edit'
  get 'recipies/update'
  get 'recipies/destroy'
  get 'recipes/public', to: 'recipes#public', as: :public_recipes
  devise_for :users
  
  get 'recipes/public/:id', to: 'recipes#publicRecipe', as: :public_recipe

  authenticated :user do
    root 'recipes#index', as: :authenticated_root
  end

  root to: "home#index"
  get "recipes", to: "recipes#index"
  get "/", to: "home#index"
  resources :recipes, only: [:show, :edit, :update, :destroy]

  resources :recipes do
    collection do
      get 'public', to: 'recipes#public'
    end
  end

  resources :dinners do
    member do
      get 'add_recipe_to_dinner'
      post 'create_recipe_dinners'
    end
  end

end

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
