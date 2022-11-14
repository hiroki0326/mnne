class Userinfo < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :income
      t.string :target_save
      t.string :use_ok_money
      t.string :fixed_cost
      t.timestamps
    end
  end
end
