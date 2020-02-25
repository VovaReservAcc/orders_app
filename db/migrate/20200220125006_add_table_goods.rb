class AddTableGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.text :name
      t.text :properties
      t.float :count_in_pack 
    end
  end
end
