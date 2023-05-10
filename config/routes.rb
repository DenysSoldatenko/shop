# frozen_string_literal: true

Rails.application.routes.draw do

  get 'users/index', to: 'users#index', as: 'account_path'

  devise_scope :user do
    get '/login', to: 'devise/sessions#login'
    get '/signup', to: 'devise/registrations#sign_up'
    get '/logout', to: 'devise/sessions#destroy'
  end

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
