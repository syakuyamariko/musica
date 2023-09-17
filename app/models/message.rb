class Message < ApplicationRecord

  belongs_to :user
  belongs_to :room
  has_one_attached :message_image

  def get_image
    unless message_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      message_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    message_image
  end

  validates :content, presence: true, length: { maximum: 140 }

end
