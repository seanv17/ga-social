Rails.application.routes.draw do

  devise_for :users

  root 'site#splash', as: :splash
#-----------------------------USER/POST PATHS-----------------------------------
  # get "/users/:user_id/posts", to: "posts#index", as: :user_posts
  # post "/users/:user_id/posts", to: "posts#create"
  # get "/users/:user_id/posts/new", to: "posts#new", as: :new_user_post
  # get "/users/:user_id/posts/:id/edit", to: "posts#edit", as: :edit_user_post
  # get "/users/:user_id/posts/:id", to: "posts#show", as: :user_post
  # put "/users/:user_id/posts/:id", to: "posts#update"
  # delete "/users/:user_id/posts/:id", to: "posts#destroy"
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



end
