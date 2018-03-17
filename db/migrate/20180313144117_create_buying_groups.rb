class CreateBuyingGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :buying_groups do |t|
      t.integer :cost
      t.string :aircraft_type
      t.integer :engine_time
      t.integer :tboh
      t.integer :max_members
      t.integer :hangar_fee
      t.integer :annual_insurance_cost
      t.integer :annual_inspection_cost
      t.string :home_airport
      t.integer :overhaul_cost
      t.integer :hourly_maintenance_reserve
      t.float :price_per_gallon
      t.integer :gallons_per_hour

      t.timestamps null: false
    end
  end
end
