# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews
  resources :categories
  resources :products
  resources :carts

  get 'users/index', to: 'users#index', as: 'account_path'
  get 'users/settings', to: 'users#settings', as: 'settings_path'
  get 'users/info', to: 'users#info', as: 'info_path'
  get 'users/info_change', to: 'users#info_change', as: 'info_change'
  put 'users/update_info', to: 'users#info_update', as: 'info_update'

  get 'cart/show', to: 'cart#show'
  post 'cart/add_product', to: 'cart#add_product_to_cart'
  post 'cart/delete_product', to: 'cart#delete_product_from_cart'
  post 'cart/increase_product_quantity', to: 'cart#increase_product_quantity'
  post 'cart/decrease_product_quantity', to: 'cart#decrease_product_quantity'
  get 'wishlist/show', to: 'wishlist_products#show'
  post 'wishlist/add', to: 'wishlist_products#add_product_to_wishlist'
  post 'wishlist/delete', to: 'wishlist_products#delete_product_from_wishlist'

  devise_scope :user do
    get '/login', to: 'devise/sessions#login'
    get '/signup', to: 'devise/registrations#sign_up'
    get '/logout', to: 'devise/sessions#destroy'
  end

  devise_for :users

  root 'application#index'
end
