class CreateCartsProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :carts, :products do |t|
      t.index :cart_id
      t.index :product_id
      t.integer :quantity, null: false, default: 1
    end
  end
end
