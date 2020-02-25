class AddTableGoodsMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :goods_mappings do |t|
      t.integer :good_id
      t.integer :order_row_id
    end
  end
end
