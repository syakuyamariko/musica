class Public::FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
    @user = User.find_by(params[:id])
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user_id = current_user.id
    @favorite.save
    @user = current_user
    redirect_to favorites_path
  end

  def index
    @favorites = Favorite.all
    @favorite = Favorite.new
    @favorite.id = current_user.id
    @user = current_user
  end

  def show
    @favorite = Favorite.find_by(params[:id])
    @user = @favorite.user
  end

  def edit
    @favorite = Favorite.find(params[:id])
    @user = current_user
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.update(favorite_params)
    redirect_to favorite_path(@favorite.id)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

  def favorite_params
    params.require(:favorite).permit(:artist, :album_best1, :album_best2, :album_best3, :song_best1, :song_best2, :song_best3, :free_record )
  end

end
