class CreateAttributesProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :attributes_products do |t|
      t.belongs_to :attribute, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
