class AddTableCustomers < ActiveRecord::Migration[6.0]
  def change
     create_table :customers do |t|
      t.text :properties
      t.text :user
      t.text :prefix
    end
  end
end