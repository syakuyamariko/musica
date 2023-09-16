class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォローをした、されたの関係
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #foreign_key(外部キー)で参照するカラムを指定
  # フォロー・フォロワーの一覧画面で使う
  has_many :followings, through: :relationships, source: :followed #throughでスルーするテーブル、sourceで参照するカラムを指定。
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image
    image = profile_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def user_signed_in?
    !current_user.nil?
  end

    # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

# is_deletedがfalseならtrueを返し、ログイン時に退会済みのユーザーが同じアカウントでログイン出来ない設定
  def active_for_authentication?
    super && (is_deleted == false)
  end


  def self.search_for(content, method)
    if method == 'perfect'
      User.where(user_name: content)
    elsif method == 'forward'
      User.where('user_name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('user_name LIKE ?', '%' + content)
    else
      User.where('user_name LIKE ?', '%' + content + '%')
    end
  end


# ゲストログイン
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.account_id = "guestuser"
      user.user_name = "ゲスト"
    end
  end

# バリデーション
validates :account_id, presence: true, uniqueness: true,
                         format: { with: /\A@[a-zA-Z0-9_]+\z/, message: "アカウントIDは@と半角英数字、アンダースコアのみ使用可能です" },
                         length: { minimum: 6, message: "6文字以上で入力してください" }

end
