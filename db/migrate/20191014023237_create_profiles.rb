class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.string :old,              null: false, default: ""
      t.string :gender,              null: false, default: ""
      t.string :message
      t.string :prefecture_id
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
