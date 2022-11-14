class Userinfmonth < ActiveRecord::Migration[6.1]
  def change
    add_column :user_infos, :month, :date,after: :fixed_cost
  end
end
