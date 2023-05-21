# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews
  resources :categories
  resources :products
  resources :carts

  get 'users/my_account', to: 'users#my_account', as: 'account_path'
  get 'users/history', to: 'checkout#history', as: 'history_path'

  get 'users/settings', to: 'users#settings', as: 'settings_path'
  get 'users/info', to: 'users#info', as: 'info_path'
  get 'users/info_change', to: 'users#info_change', as: 'info_change'
  put 'users/info_update', to: 'users#info_update', as: 'info_update'
  get 'users/email_change', to: 'users#email_change', as: 'email_change'
  put 'users/email_update', to: 'users#email_update', as: 'email_update'
  get 'users/password_change', to: 'users#password_change', as: 'password_change'
  put 'users/password_update', to: 'users#password_update', as: 'password_update'
  get 'checkout', to: 'checkout#index', as: 'checkout'
  post 'checkout/create', to: 'checkout#create', as: 'checkout_create'
  get 'checkout/success', to: 'checkout#success', as: 'success'

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
