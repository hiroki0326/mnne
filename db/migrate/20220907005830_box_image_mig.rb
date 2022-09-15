class BoxImageMig < ActiveRecord::Migration[6.1]
  def change
    add_column :money_boxes, :image, :string,after: :title
  end
end
