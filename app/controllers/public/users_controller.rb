class Public::UsersController < ApplicationController
  before_action :set_user, only: [:likes]
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
    @posts = @user.posts
    @post = Post.new
  end

  def index
    @user = User.find_by(params[:users_id]) #指定した id が存在しないことが想定される場合 → find_by メソッドを使う
    #@users = User.all
    @users = User.where(is_deleted: false)
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

  def withdraw
    @user = User.find(current_user.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def followings #フォロワー一覧画面の表示実装で追加
    @users = @user.followings
  end

  def followers #フォロワー一覧画面の表示実装で追加
    @users = @user.followers
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(user_name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image, :image )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end

