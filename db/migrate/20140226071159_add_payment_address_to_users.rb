class AddPaymentAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :payment_address, :string
  end
end
