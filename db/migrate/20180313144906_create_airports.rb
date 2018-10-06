class CreateAirports < ActiveRecord::Migration[5.1]
  def change
    create_table :airports do |t|
      t.string :code
      t.string :description
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
