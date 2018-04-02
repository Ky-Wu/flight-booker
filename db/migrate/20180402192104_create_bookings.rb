class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :flight, foreign_key: true
      t.datetime :date
      t.references :from_airport, foreign_key: true
      t.references :to_airport, foreign_key: true

      t.timestamps
    end
  end
end
