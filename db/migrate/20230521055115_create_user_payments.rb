class CreateUserPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :user_payments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :payment_type
      t.string :provider
      t.string :account_number
      t.string :expiry

      t.timestamps
    end
  end
end
