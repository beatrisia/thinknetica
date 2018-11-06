class Route
  attr_reader :stations, :number

  def initialize(number, departure_station, arrival_station)
    @stations = [departure_station, arrival_station]
    @number = number
  end

  def add(station)
    @stations.insert(-2, station)
  end

  def delete(station)
    @stations.delete(station) if station != first_station && station != last_station
  end

  def show
    @stations.each { |station| puts station }
  end

  def first_station
    @stations[0]
  end

  def last_station
    @stations[-1]
  end
end
