# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration' }
  get 'high_scores/index'
  resources :users, only: [:show]

  resources :high_scores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
