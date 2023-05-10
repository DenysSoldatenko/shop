class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table(:categories, if_exists: true)
    create_table :categories do |t|
      t.bigint :parent_id
      t.string :name
      t.text :description

      t.timestamps
    end

    add_foreign_key :categories, :categories, column: :parent_id
  end
end
