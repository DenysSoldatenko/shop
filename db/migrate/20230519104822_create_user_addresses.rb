class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :phone_number

      t.timestamps
    end
  end
end
