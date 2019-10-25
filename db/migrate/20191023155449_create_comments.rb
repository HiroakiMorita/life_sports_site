class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.text :image
      t.integer :user_id, foreign_key: true
      t.integer :group_id, foreign_key: true

      t.timestamps
    end
  end
end
