class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.string :artist, null: false
      t.string :album_best1, null: false
      t.string :album_best2, null: false
      t.string :album_best3, null: false
      t.string :song_best1, null: false
      t.string :song_best2, null: false
      t.string :song_best3, null: false
      t.text :free_record
      t.timestamps
    end
  end
end
