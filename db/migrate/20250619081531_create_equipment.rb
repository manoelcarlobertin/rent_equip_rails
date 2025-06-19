class CreateEquipment < ActiveRecord::Migration[8.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :serial_number

      t.timestamps
    end
    add_index :equipment, :serial_number, unique: true
  end
end
