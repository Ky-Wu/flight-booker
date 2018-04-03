class Booking < ApplicationRecord
  belongs_to :flight
  has_one :from_airport, through: :flight
  has_one :to_airport, through: :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers 

end
