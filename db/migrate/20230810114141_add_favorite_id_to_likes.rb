class AddFavoriteIdToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :favorite_id, :integer
  end
end
