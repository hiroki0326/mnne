class CreateFixedCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fixed_costs do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :price
      t.timestamps
    end
  end
end
