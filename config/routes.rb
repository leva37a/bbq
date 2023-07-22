Rails.application.routes.draw do
  resources :comments
  root to: "events#index"
  devise_for :users

  resources :events do
    resources :comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

end
