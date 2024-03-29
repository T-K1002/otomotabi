Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users
  resources :groups, only: [:new, :index, :create, :edit, :update, :show]
  resources :groups do
    resources :permits, only: [:index, :create, :destroy]
    resources :group_users, only: [:create, :destroy]
    delete "exit" => "groups#exit"
    get "prefectures/:id" => "trips#prefecture"
    resources :trips do
      resources :spots
    end
  end
  get "search" => "groups#search"
  
 
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
