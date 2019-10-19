class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|

      t.string :old,                  null: false, default: ""
      t.integer :gender,              null: false
      t.text :message
      t.integer :job,                  null: false
      t.integer :holiday,              null: false
      t.bigint :prefecture_id,        null: false, foreign_key: true
      t.integer :user_id,             null: false
      
      t.timestamps
    end
  end
end
