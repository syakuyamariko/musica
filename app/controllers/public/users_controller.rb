class Public::UsersController < ApplicationController
before_action :set_user, only: [:likes]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new

  end

  def index
    @user = User.find_by(params[:users_id]) #指定した id が存在しないことが想定される場合 → find_by メソッドを使う
    @users = User.all
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def liked_posts
    @user = User.find(params[:id])
    liked_posts = Like.where(user_id: @user.id).pluck(:post_id)
  if liked_posts.present?
    @like_posts = Post.where(id: liked_posts)
  else
    @like_posts = []
  end
    render 'show_liked_posts'
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image, :image )
  end

  def set_user
    @user = User.find(params[:id])
  end

end