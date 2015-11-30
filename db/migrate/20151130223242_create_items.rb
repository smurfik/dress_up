class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id
      t.integer :product_option_id
      t.integer :price
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
