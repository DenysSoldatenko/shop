class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.datetime :date
      t.decimal :price, precision: 10, scale: 2
      t.belongs_to :product, foreign_key: true
      t.timestamps
    end
  end
end
