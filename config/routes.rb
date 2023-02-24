
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
# Show all movies


Rails.application.routes.draw do
  resources :lists, only: [:index, :new, :create, :show] do
    resources :bookmarks, only: [:create, :destroy, :new]
  end

# Defines the root path route ("/")
root "lists#index"
end
