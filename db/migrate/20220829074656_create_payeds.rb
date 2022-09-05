class CreatePayeds < ActiveRecord::Migration[6.1]
  def change
    create_table :payeds do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :price
      t.date :payed_at
      t.timestamps
    end
  end
end
