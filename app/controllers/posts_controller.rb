class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def show

  end

  def edit

  end

  def update

  end

  def add

  end

  def create

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
