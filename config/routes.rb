# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # match '/auth/steam/callback', to: 'omniauthcallbacks#steam', via: [:get, :post]
  root to: 'home#index'
  resources :articles, only: %i[index show] do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  namespace :admin do
    get '/', to: 'dashboard#dashboard'
    resources :users
    resources :articles
    resources :images
    resources :ips
    resources :highlights
  end

  get '/terms-of-service', to: 'home#terms_of_service'
  get '/privacy-policy', to: 'home#privacy_policy'
  get '/about-us', to: 'home#about_us'

  get '/:id', to: 'members#show'
  get '/users/account', to: 'members#account'
  patch '/users/account', to: 'members#update', as: 'edit_member_account'
end
