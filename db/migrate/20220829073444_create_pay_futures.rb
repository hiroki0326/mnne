class CreatePayFutures < ActiveRecord::Migration[6.1]
  def change
    create_table :pay_futures do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :price
      t.date :pay_on
      t.timestamps
    end
  end
end
