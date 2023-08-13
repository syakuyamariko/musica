class Favorite < ApplicationRecord
belongs_to :user
has_many :likes

def liked_by?(user)
    likes.exists?(user_id: user.id)
end

end