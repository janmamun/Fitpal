# config/routes.rb
Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users, only: [:show, :edit, :update]
  resources :gyms, only: [:index, :show] do
    collection do
      get 'search'
    end
  end
  resources :connections, only: [:index, :create, :destroy]
  resources :chats, only: [:index, :create, :show]
  resources :workouts, only: [:index, :create]

  get "up" => "rails/health#show", as: :rails_health_check

  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end
end
