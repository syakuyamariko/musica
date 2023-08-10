class Public::LikesController < ApplicationController

  def create
  if params[:post_id].present?
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)
  else
    favorite = Favorite.find(params[:favorite_id])
    like = current_user.likes.new(favorite_id: favorite.id)
  end
    like.save!
    redirect_to request.referer
  end

  def destroy
  if params[:post_id].present?
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
  else
    favorite = Favorite.find(params[:favorite_id])
    like = current_user.likes.find_by(favorite_id: favorite.id)
  end
    like.destroy
    redirect_to request.referer
  end
end
