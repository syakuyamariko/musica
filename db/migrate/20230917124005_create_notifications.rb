class CreateNotifications < ActiveRecord::Migration[6.1]

  def change
    create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
      t.references :subject, polymorphic: true
      t.references :user, null: false, foreign_key: true
      t.integer :action_type, null: false
      t.boolean :checked, default: false, null: false
      t.integer :visitor_id
      t.integer :visited_id

      t.timestamps
    end
  end
end