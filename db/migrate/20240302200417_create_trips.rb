class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.string :driver
      t.string :client
      t.string :vehicle
      t.string :starting
      t.string :ending
      t.string :running
      t.date :end_date

      t.timestamps
    end
  end
end
