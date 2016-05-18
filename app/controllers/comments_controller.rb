class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    redirect_to splash_path
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
      flash[:notice] = 'Comment added successfully'
      create_notification @comment
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    else
      flash[:error] = @comment.errors.full_messages_to_sentence
      render 'new'
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
    p @comment
    if current_user == @comment.user
      render :edit
    else
      flash[:error] = "You can only edit your own comments"
      redirect_to post_path(params[:post_id])
    end
  end

  def update
    comment = Comment.find_by_id(params[:id])
#------------code for best_in_place gem - inline editing---------------------
    respond_to do |format|
      if comment.update_attributes(comment_params)
        format.html { redirect_to(comment, flash[:notice] => 'Comment updated successfully') }
        format.json { respond_with_bip(comment) }
      else
        flash[:error] = comment.errors.full_messages_to_sentence
        format.html { render :action => "edit" }
        format.json { respond_with_bip(comment) }
      end
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.destroy

    if comment.destroy
      flash[:notice] = "Comment deleted successfully"
      redirect_to posts_path
    else
      flash[:error] = comment.errors.full_messages_to_sentence
      redirect_to posts_path
    end
  end

private

  def create_notification(comment)
    post = Post.find_by_id(comment.post_id)
    return if current_user.id == post.user_id
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
