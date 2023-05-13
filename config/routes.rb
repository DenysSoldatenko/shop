# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews
  resources :categories
  resources :discounts
  resources :purchases
  resources :products

  get 'users/index', to: 'users#index', as: 'account_path'

  devise_scope :user do
    get '/login', to: 'devise/sessions#login'
    get '/signup', to: 'devise/registrations#sign_up'
    get '/logout', to: 'devise/sessions#destroy'
  end

  devise_for :users

  root 'application#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
