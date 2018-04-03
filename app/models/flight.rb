class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport,   class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings
  default_scope { order(date: :asc) }
  scope :future, -> { where("date > ?", Time.now) }
  scope :on_day, ->(date) {
    day = date.to_datetime.beginning_of_day
    where(date: day..day.end_of_day)
  }

  def formatted_duration
    hours = duration / 60
    minutes = duration % 60
    "#{hours.to_s} hours and #{minutes.to_s} minutes"
  end 

end
