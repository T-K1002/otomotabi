Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  devise_scope :user do
    post "users/guest_sign_in" => "users/sessions#guest_sign_in"
  end
  resources :users, only: [:index, :show]
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
  resources :recommends, only: [:show, :new, :create]
end
