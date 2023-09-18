class Public::NotificationsController < ApplicationController

  def index
# 現在ログインしているユーザーに関連付けられた全ての通知を取得
    @notifications = current_user.notifications.order(created_at: :desc).page(params[:page]).per(20)
# ここで取得した通知の中から、まだ確認されていない（checked: false）通知を取り出す
    @notifications.where(checked: false).each do |notification|
# 未確認の通知を確認済み（checked: true）に更新する
      notification.update(checked: true)
    end
  end

  def destroy
    @notifications = current_user.notifications.destroy_all
    redirect_to notifications_path
  end
end