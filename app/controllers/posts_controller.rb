class PostsController < ApplicationController

  def index
    if params[:search]
      @posts = Post.order(updated_at: :desc).search(params[:search]).paginate(:page => params[:page], :per_page => 6)
    else
      @posts = Post.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 6)
    end
    render :index
  end

  def search
    render :search
  end

  def new
    if current_user
      #record new post in notifications
      respond_to do |format|
        format.html
        format.js
      end
      #we load up @post = Post.new and @user = current_user in the _form partial
    else
      redirect_to splash_path
    end
  end

  def create
    post = Post.new(post_params)
    if post.body.length == 0
      flash[:error] = "Post cannot be blank"
      redirect_to posts_path
    else
      post.user = current_user
      if post.save
        flash[:notice] = "Post saved successfully"
        redirect_to posts_path
      else
        flash[:error] = post.errors.full_messages.join(", ")
        redirect_to new_post_path
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = current_user
    render :edit
  end

  def update
    @post = Post.find params[:id]
    # code for best_in_place gem - inline editing
     respond_to do |format|
       if @post.update_attributes(post_params)
         format.html { redirect_to(@posts, flash[:notice] => 'Post updated successfully') }
         format.json { respond_with_bip(@post) }
       else
         flash[:error] = @post.errors.full_messages.join(", ")
         format.html { render :action => "edit" }
         format.json { respond_with_bip(@post) }
       end
     end
  end

  def show
    if Post.exists?(params[:id])
      @post = Post.find(params[:id])
      tag = @post.comments.all
      @comments = tag.hash_tree
      render :show
    else
      redirect_to splash_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deleted successfully"
      # call the index method after deleting a post
      index
    else
      flash[:error] = @post.errors.full_messages.join(", ")
    end
  end

  def like
    @post = Post.find(params[:id])
    like = Like.create(like: params[:like], user: current_user, post: @post)
    if like.valid?
      flash[:success] = "You liked post #{@post.id}"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a post once"
      redirect_to :back
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :avatar)
  end

end
