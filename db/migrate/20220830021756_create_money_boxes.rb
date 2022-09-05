class CreateMoneyBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :money_boxes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :title
      t.timestamps
    end
  end
end
