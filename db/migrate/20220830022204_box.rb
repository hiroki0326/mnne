class Box < ActiveRecord::Migration[6.1]
  def change
    add_column :payeds, :money_box_id, :integer,after: :id
    remove_column :payeds, :user_id
  end
end
