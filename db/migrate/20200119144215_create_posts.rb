class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :image, null: false
      t.text :capacity, false
      t.text :comment
      t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
