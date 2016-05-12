Rails.application.routes.draw do


  devise_for :users
  root 'site#splash', as: :splash

  resources :users

end
