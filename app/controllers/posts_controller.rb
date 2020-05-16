class PostsController < ApplicationController
  before_action :authenticate_user
  
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  
  def new
    @post = Post.new
  end
  
  
  def create
    @post = Post.new(content: params[:content],
                     user_id: @current_user.id)
    if @post.save
    redirect_to("/posts")
    else
    render("posts/new")
    end
  end
  
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  
   def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts")
    else
      render("posts/edit")
    end
   end
  
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts")
  end
end
