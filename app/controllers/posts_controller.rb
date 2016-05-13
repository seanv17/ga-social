class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def new
      @post = Post.new
      @user = current_user
      render :new
  end

  def create
    post = Post.new(post_params)
    post.user_id = 1
    if post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end




  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

end
