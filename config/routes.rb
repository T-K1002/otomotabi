Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :index, :create, :edit, :update, :show]
  resources :groups do
    resources :permits, only: [:index, :create, :destroy]
    resources :group_users, only: [:create, :destroy]
    delete "exit" => "groups#exit"
    resources :trips do
      resources :spots
    end
  end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
