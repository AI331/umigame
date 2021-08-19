Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms do
    get :search, on: :collection
    resources :messages, only: [:create, :destroy]
    resources :questions, only: [:create, :destroy]
  end
 
end
