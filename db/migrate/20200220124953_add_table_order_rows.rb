class AddTableOrderRows < ActiveRecord::Migration[6.0]
  def change
    create_table :order_rows do |t|
      t.integer :order_id
      t.integer :good_id
      t.float :count 
      t.float :height 
      t.float :width 
      t.float :price 
      t.float :sum 
    end
  end
end
