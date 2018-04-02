class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.references :from_airport, foreign_key: true, index: true
      t.references :to_airport, foreign_key: true, index: true

      t.timestamps
    end
  end
end
