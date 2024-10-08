class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content, null: false
      t.string :visibility, null: false, default: "draft"

      t.timestamps
    end
  end
end
