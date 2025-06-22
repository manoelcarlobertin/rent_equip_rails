class AddDetailsToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :dob, :date, null: false
    add_column :customers, :email, :string, null: false
    add_index :customers, :email, unique: true
    add_column :customers, :mobile_phone, :string, null: false
  end
end
