class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post, optional:true
  belongs_to :favorite, optional:true
  has_one :notification, as: :subject, dependent: :destroy#ポリモーフィック関連付け

# Likeモデルのインスタンスがデータベースに保存された（create）後（after）に、create_notificationsメソッドを実行
  after_create_commit :create_notifications

  private

  def create_notifications
# subject: 通知の対象となるオブジェクト/end_user: 通知の受信者を表すオブジェクト/action_type: 通知の種類やアクションを表すシンボル
if self.post_id
    Notification.create(subject: self, user: self.post.user, action_type: :liked_to_own_post)
else
    Notification.create(subject: self, user: self.favorite.user, action_type: :liked_to_own_post)
end

  end

=======
  belongs_to :user
  belongs_to :post, optional:true
  belongs_to :favorite, optional:true
>>>>>>> origin/main
end
