# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews
  resources :categories
  resources :discounts
  resources :purchases
  resources :products
  resources :carts

  get 'users/index', to: 'users#index', as: 'account_path'
  get 'cart/show', to: 'cart#show'
  post 'cart/add_product', to: 'cart#add_product_to_cart'
  post 'cart/delete_product', to: 'cart#delete_product_from_cart'
  post 'cart/increase_product_quantity', to: 'cart#increase_product_quantity'
  post 'cart/decrease_product_quantity', to: 'cart#decrease_product_quantity'

  devise_scope :user do
    get '/login', to: 'devise/sessions#login'
    get '/signup', to: 'devise/registrations#sign_up'
    get '/logout', to: 'devise/sessions#destroy'
  end

  devise_for :users

  root 'application#index'
end
