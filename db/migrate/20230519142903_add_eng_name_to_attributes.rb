class AddEngNameToAttributes < ActiveRecord::Migration[7.0]
  def change
    add_column :attributes, :name_eng, :string
  end
end
