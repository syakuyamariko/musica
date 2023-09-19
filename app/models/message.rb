class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
  has_one :notification, as: :subject, dependent: :destroy
  #has_one_attached :message_image

  after_create_commit :create_notifications

  # def get_image
  #   unless message_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
  #     message_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   message_image
  # end

  validates :content, presence: true, length: { maximum: 140 }

  private

  def create_notifications
# whereで検索をかけると配列で返ってくるため.firstで最初のuserを絞り込んでいる
    Notification.create(subject: self, user: room.entries.where.not(user_id: user_id).first.user, action_type: :messaged_to_me)
  end

end
