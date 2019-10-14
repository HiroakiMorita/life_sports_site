class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.string :old,              null: false, default: ""
      t.string :gender,              null: false, default: ""
      t.string :message,              null: false, default: ""
      t.bigint :prefecture_id, null: false, foreign_key: true
      t.integer :user_id, null: false
      
      t.timestamps
    end
  end
end
