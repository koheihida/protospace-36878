Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  resources :users, only: [:show]
  resources :prototypes, only: [:new,:create,:show,:edit,:destroy,:update] do
    resources :comments, only: [:create, :show, :index]
  end

end
