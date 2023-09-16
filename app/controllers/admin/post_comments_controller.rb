class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin! # 管理者認証が必要な場合、適宜認証の設定を追加

  def index
    @comments = PostComment.all # または適切な検索条件に基づく取得処理を実装
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_comments_path, notice: 'コメントが削除されました'
  end
end

