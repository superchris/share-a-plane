class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :description
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
