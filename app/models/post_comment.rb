class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_one :notification, as: :subject, dependent: :destroy #ポリモーフィック関連付けを示しており、NotificationモデルのsubjectがPostCommentモデルになる。

# PostCommentモデルのインスタンスがデータベースに保存された（create）後（after）に、create_notificationsメソッドを実行
  after_create_commit :create_notifications

  validates :comment, presence: true

  private

  def create_notifications
# subject: 通知の対象となるオブジェクト/end_user: 通知の受信者を表すオブジェクト/action_type: 通知の種類やアクションを表すシンボル
    Notification.create(subject: self, user: post.user, action_type: :commented_to_own_post)
  end

=======

    validates :comment, presence: true
>>>>>>> origin/main
end

