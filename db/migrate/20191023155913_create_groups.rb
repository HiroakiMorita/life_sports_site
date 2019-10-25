class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name,           null: false, unique: true, index: true
      t.integer :user_id, foreign_key: true
      t.integer :group_id, foreign_key: true

      t.timestamps
    end
  end
end
