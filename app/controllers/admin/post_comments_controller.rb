class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin! #URLからの不正ログインを阻止する
  before_action :is_matching_login_admin, only: [:destroy]

  def index
    @comments = PostComment.all
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_comments_path, notice: 'コメントが削除されました'
  end
end

