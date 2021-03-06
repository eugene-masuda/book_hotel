# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration' },
             controllers: { registrations: 'registrations' }

  get 'high_scores/index'
  resources :users, only: [:show]
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      delete 'delete_image_attachment'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :photos, only: [:create, :destroy]
  end
  resources :high_scores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
