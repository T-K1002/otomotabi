Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new, :index, :create, :edit, :update, :show]
  resources :groups do
    get "join" => "groups#join"
    delete "exit" => "groups#exit"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
