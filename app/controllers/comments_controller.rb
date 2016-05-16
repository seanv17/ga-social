class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
      @comment.user_id = current_user.id
      @comment.post_id = params[:post_id]
    else
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      @comment.post_id = params[:post_id]
    end

    if @comment.save
      create_notifications @post, @comment
      respond_to do |format|
        format.html { redirect_to splash_path }
        format.js
      flash[:success] = 'Your comment was successfully added!'
      redirect_to posts_path
    else
      render 'new'
    end

  end

  def edit
    @comment = Comment.find_by_id(params[:id])
    p @comment
    render :edit
    if current_user == @comment.user
      render :edit
    else
      flash[:error] = "You can only edit your own comments"
      redirect_to post_path(params[:post_id])
    end

  end

  def update
    comment = Comment.find_by_id[:id]
    comment.update(comment_params)
    redirect_to post_path(params[:post_id])

  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy
    redirect_to posts_path

    # if comment.destroy
    #   flash[:notice] = "Comment deleted"
    #   redirect_to post_path(params[:post_id])
    # else
    #   flash[:error] = post.errors.full_messages_to_sentence
    #`redirect_to post_path(params[:post_id])`
    # end
  end



private

def create_notification(post)
  return if post.user.id == current_user.id
  Notification.create(user_id: post.user.id,
                      notified_by_id: current_user.id,
                      post_id: post.id,
                      comment_id: comment.id,
                      notice_type: 'comment')
end  

  def comment_params
    params.require(:comment).permit(:body,:user_id,:post_id)
  end


end
