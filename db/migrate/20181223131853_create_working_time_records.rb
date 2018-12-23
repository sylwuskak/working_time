class CreateWorkingTimeRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :working_time_records do |t|
      t.date :date, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.references :user, null: false

      t.timestamps
    end
  end
end
