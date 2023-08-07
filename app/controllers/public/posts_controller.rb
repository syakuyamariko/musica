class Public::PostsController < ApplicationController
  #before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to book_path(@post), notice: "You have created post successfully."
    else
      @posts = Post.all
      render 'index'
    end
  end

  def index
    @posts = Post.all
    @post = Post.new
    @post.id = current_user.id
    @user = current_user
  end

  def show
  end

  def edit
  end

end
