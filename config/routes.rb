Rails.application.routes.draw do

  devise_for :users

  root 'site#splash', as: :splash

#-----------------------------USER PATHS----------------------------------------
  get "/users", to: "users#index", as: :users
  post "/users", to: "users#create"
  get "/users/new", to: "users#new", as: :new_user
  get "/users/:id/edit", to: "users#edit", as: :edit_user
  get "/users/:id", to: "users#show", as: :user
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"
#-----------------------------POST PATHS----------------------------------------
  get "/posts", to: "posts#index", as: :posts
  post "/posts", to: "posts#create"
  get "/posts/new", to: "posts#new", as: :new_post
  get "/posts/:id/edit", to: "posts#edit", as: :edit_post
  get "/posts/:id", to: "posts#show", as: :post
  patch "/posts/:id", to: "posts#create"
  delete "posts/:id", to: "posts#destroy"



end
