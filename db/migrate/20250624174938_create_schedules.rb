class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :equipment, null: false, foreign_key: true
      t.string :status
      t.date :period_start
      t.date :period_end

      t.timestamps
    end
  end
end
