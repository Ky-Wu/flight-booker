airport_codes = ['ATL','LAX','ORD','DFW','JFK','DEN','SFO',
         'LAS','CLT','SEA','PHX','MIA','MCO','IAH']
airports = []
airport_codes.each do |code|
  airport = Airport.create(code: code)
  airports << airport
end

airports.each do |from_airport|
  airports.each do |to_airport|
    unless from_airport == to_airport
      Flight.create(to_airport: to_airport, from_airport: from_airport,
                    date: rand(1.year).seconds.from_now, duration: rand(5..600))
    end
  end
end
