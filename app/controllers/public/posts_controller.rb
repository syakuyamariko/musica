class Public::PostsController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    @user = current_user
    redirect_to posts_path
  end

  def index
    @posts = Post.all
    @post = Post.new
    @post.id = current_user.id
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_new = Post.new
  end

  def edit
  end

end

def post_params
    params.require(:post).permit(:body, :image)
end
