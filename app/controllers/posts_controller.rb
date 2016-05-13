class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def new
    if current_user
      @post = Post.new
      @user = current_user
      render :new
    else
      redirect_to splash_path
    end
  end

  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
  end

  def update

  end

# def update
#   @user = User.find(params[:user_id])
#   post = Post.find(params[:id])
#   post.update_attributes(post_params)
#   flash[:notice] = "Post updated."
#   redirect_to user_path(@user)
# end

  def show

  end

  def delete

  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id)
  end


end
