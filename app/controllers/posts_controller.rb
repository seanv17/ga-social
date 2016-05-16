class PostsController < ApplicationController

  def index
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 6)
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 6)
    end
    render :index
  end

  def search
    render :search
  end

  def new
    session[:return_to] ||= request.referer
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
    render :edit
  end

  def update
    @post = Post.find params[:id]
    # code for best_in_place gem - inline editing
     respond_to do |format|
       if @post.update_attributes(post_params)
         format.html { redirect_to(@posts, :notice => 'post was successfully updated.') }
         format.json { respond_with_bip(@post) }
       else
         format.html { render :action => "edit" }
         format.json { respond_with_bip(@post) }
       end
     end
  end

  def show

    @post = Post.find(params[:id])
    tag = @post.comments.all
    @comments = tag.hash_tree
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    index
  end

  def like
    @post = Post.find(params[:id])
    like = Like.create(like: params[:like], user: current_user, post: @post)
    if like.valid?
      flash[:success] = "You liked post #{@post.id}"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a posts once"
      redirect_to :back
    end
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :avatar)
  end


end
