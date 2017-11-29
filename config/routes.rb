Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  resources :videos
  resources :users
  
end
