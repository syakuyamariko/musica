class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :favorites, dependent: :destroy #UserモデルとFavoritesモデルを関連付ける
  has_many :book_comments, dependent: :destroy #UserモデルとBookCommentモデルを関連付ける
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォローをした、されたの関係
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #foreign_key(外部キー)で参照するカラムを指定
  # フォロー・フォロワーの一覧画面で使う
  has_many :followings, through: :relationships, source: :followed #throughでスルーするテーブル、sourceで参照するカラムを指定。
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_one_attached :profile_image

  def get_profile_image
    image = profile_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
