class Public::LikesController < ApplicationController

  def create
    if params[:post_id].present?
      @post = Post.find(params[:post_id])
      like = current_user.likes.new(post_id: @post.id)
    else
      @favorite = Favorite.find(params[:favorite_id])
      like = current_user.likes.new(favorite_id: @favorite.id)
    end
    like.save
    type = params[:type]
    if type == "good"
      render :good
    else
      render :like
    end
      @post.create_notification_like!(current_user) #通知メソッドの呼び出し
  end

  def destroy
    if params[:post_id].present?
      @post = Post.find(params[:post_id])
      like = current_user.likes.find_by(post_id: @post.id)
    else
      @favorite = Favorite.find(params[:favorite_id])
      like = current_user.likes.find_by(favorite_id: @favorite.id)
    end
    like.destroy
    type = params[:type]
    if type == "good"
      render :good
    else
      render :like
    end
  end
end
