class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :post_image
  has_one_attached :video

  def get_image
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image
  end

  def liked_by?(user)
  # ユーザーが存在する場合のみ処理を実行
    if user.present?
      likes.exists?(user_id: user.id)
    else
      false
    end
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

#バリデーション
   validates :body,presence: { message: "投稿内容を入力してください" }

end

