class ChangeNullConstraintForDriverAndVehicleInExpenses < ActiveRecord::Migration[7.0]
  def change
    change_column :expenses, :driver_id, :bigint, null: true
    change_column :expenses, :vehicle_id, :bigint, null: true
  end
end
