class CommentsController < ApplicationController

  def index
      @comments = Comment.all
  end

  def new
    session[:return_to] ||= request.referer
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def show
    @comment = Comment.find_by_id(params[:id])

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
      flash[:success] = 'Your comment was successfully added!'
      @posts = Post.paginate( :page => params[:page])
      redirect_to session.delete(:return_to)

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
    # post = Post.find(params[:id])
    comment = Comment.find_by_id(params[:id])
    p "this is the comment" + comment.body
    # comment.update(comment_params)
    # redirect_to post_path(params[:post_id])
#------------best in place---------------------
    respond_to do |format|
      if comment.update_attributes(comment_params)
        p "here inside respond"
        format.html { redirect_to(comment, :notice => 'comment update was successfully updated.') }
        format.json { respond_with_bip(comment) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(comment) }
      end
    end



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

  def comment_params
    params.require(:comment).permit(:body,:user_id,:post_id)
  end


end
