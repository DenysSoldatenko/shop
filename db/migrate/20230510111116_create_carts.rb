class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string :session_id
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
