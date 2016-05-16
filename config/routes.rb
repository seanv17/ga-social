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
  get "/posts/search", to: "posts#search", as: :search_posts
  get "/posts/:id/edit", to: "posts#edit", as: :edit_post
  get "/posts/:id", to: "posts#show", as: :post
  get "/posts/new", to: "posts#new", as: :new_post
  patch "/posts/:id", to: "posts#update"
  put "/posts/:id", to: "posts#update"
  delete "posts/:id", to: "posts#destroy"
  post "/posts/:id/like", to: 'posts#like', as: :like_post
#----------------------------COMMENTS PATHS-------------------------------------
  get "/posts/:post_id/comments", to: "comments#index", as: :comments
  post "/posts/:post_id/comments", to: "comments#create"
  get "/comments/:id/", to: "comments#show", as: :comment
  get "/posts/:post_id/comments/new/(:parent_id)", to: "comments#new", as: :new_comment
  get "/posts/:post_id/comments/:id", to: "comments#edit", as: :edit_comment
  patch "/posts/:post_id/comments/:id", to: "comments#update"
  put "/comments/:id", to: "comments#update"
  delete "/posts/:post_id/comments/:id", to: "comments#destroy"

end
