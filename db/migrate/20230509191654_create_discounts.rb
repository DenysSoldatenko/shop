class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.decimal :percent, precision: 10, scale: 2
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
