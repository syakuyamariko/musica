class Public::FavoritesController < ApplicationController

  before_action :authenticate_user!

  def new
    @favorite = Favorite.new
    @user = User.find_by(params[:id])
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    @user = current_user
    redirect_to favorites_path(user_id: @user.id), notice: "お気に入りの投稿に成功しました"
  end

  def index
    @favorites = Favorite.where(user_id: (params[:user_id]))
    @favorite = Favorite.new
    @favorite.id = current_user.id
    @user = current_user
  end

  def show
    @favorite = Favorite.find(params[:id])
    @user = @favorite.user
  end

  def edit
    @favorite = Favorite.find(params[:id])
    @user = current_user
  end

  def update
    @favorite = Favorite.find(params[:id])
    if @favorite.update(favorite_params)
      flash[:notice] = "お気に入りが更新されました"
      redirect_to favorite_path(@favorite.id)
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @user = current_user
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path(user_id: @user.id)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :artist, :album_best1, :album_best2, :album_best3, :song_best1, :song_best2, :song_best3, :free_record )
  end

end
