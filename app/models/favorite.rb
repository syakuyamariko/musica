class Favorite < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy

    def liked_by?(user)
      likes.exists?(user_id: user.id)
    end
end
