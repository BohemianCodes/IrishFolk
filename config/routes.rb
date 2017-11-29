Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  resources :videos
  resources :users

  get 'users/name'
end
