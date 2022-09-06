class Usertable < ActiveRecord::Migration[6.1]
  create_table :users do |t|
    t.string :email
    t.string :password_digest
    t.string :name
    t.timestamps
  end
end
