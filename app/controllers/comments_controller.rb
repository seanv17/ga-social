class CommentsController < ApplicationController

  def index
      @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:id]

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to post_path
    else
      render 'new'
    end
  end


private

  def comment_params
    params.require(:comment).permit(:body,:user_id,:post_id)
  end


end
