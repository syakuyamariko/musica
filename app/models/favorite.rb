class Favorite < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_one :notification, as: :subject, dependent: :destroy #ポリモーフィック関連付け

  def liked_by?(user)
      likes.exists?(user_id: user.id)
  end

  #バリデーション
  validates :artist, presence: true
  validates :album_best1, presence: true
  validates :album_best2, presence: true
  validates :album_best3, presence: true
  validates :song_best1, presence: true
  validates :song_best2, presence: true
  validates :song_best3, presence: true


end
