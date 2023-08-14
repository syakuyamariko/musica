class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :post_image

  def get_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(body: content)
    elsif method == 'forward'
      Post.where('body LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('body LIKE ?', '%' + content)
    else
      Post.where('body LIKE ?', '%' + content + '%')
    end
  end
end
