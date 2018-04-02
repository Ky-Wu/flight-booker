class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :from_airport
  belongs_to :to_airport
end
