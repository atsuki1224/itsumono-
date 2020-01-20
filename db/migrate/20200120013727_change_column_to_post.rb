class ChangeColumnToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :created_at, :datetime, null: true
    change_column :posts, :updated_at, :datetime, null: true
  end
end
