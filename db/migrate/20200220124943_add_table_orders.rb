class AddTableOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.text :number
      t.date :date
      t.float :sum
      t.integer	:id_other_app
    end
    add_column :customers, :name, :string, after: :id
  end
end
