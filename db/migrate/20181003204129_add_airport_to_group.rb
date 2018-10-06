class AddAirportToGroup < ActiveRecord::Migration[5.1]
  def change
    change_table :buying_groups do |t|
      t.remove :home_airport
      t.references :airport
    end
  end
end
