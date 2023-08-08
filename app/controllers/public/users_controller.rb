class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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


  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image)
  end

end