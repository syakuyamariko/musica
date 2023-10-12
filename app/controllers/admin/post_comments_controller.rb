class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin! #URLからの不正ログインを阻止する

  def index
    @comments = PostComment.all
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_path(@comment.post), notice: 'コメントが削除されました'
  end

end

