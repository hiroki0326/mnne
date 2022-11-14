class Userinfmonthd < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_infos, :fixed_cost, :string
  end
end
