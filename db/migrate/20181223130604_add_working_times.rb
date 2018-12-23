class AddWorkingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :working_times do |t|
      t.date :date, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.references :user, null: false
    end 
  end
end
