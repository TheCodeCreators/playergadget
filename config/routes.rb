# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # match '/auth/steam/callback', to: 'omniauthcallbacks#steam', via: [:get, :post]
  root to: 'home#index'
  resources :articles, only: %i[index show]

  namespace :admin do
    get '/', to: 'dashboard#dashboard'
    resources :users
    resources :articles
    resources :images
    resources :ips
    resources :highlights
  end
end
