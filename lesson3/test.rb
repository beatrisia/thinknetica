class Station
  attr_accessor :trains

  def initialize(name)
    @name = name
  end

  def add_train(train)
    train.to_i +=1

  def current_trains(station)
    @trains.sum if @station_name = station
  end
end

class Route
  def initialize(departure_station, arrival_station)
    @departure_station = departure_station
    @arrival_station = arrival_station
    @way_stations = []
  end

  def add_way_station(way_station)
    @way_stations << way_station
  end

  def full_route
    @full_route = [@departure_station, @way_stations, @arrival_station].flatten
  end

  def delete_way_station(way_station)
    @way_stations.delete(way_station)
  end

  def show_stations
    puts @departure_station
    puts @way_stations if @way_stations.any?
    puts @arrival_station
  end
end

class Train
  attr_accessor :speed
  attr_reader :carriages_quantity

  def initialize(number, type, carriages_quantity)
    @number = number
    @type = type
    @carriages_quantity = carriages_quantity
  end

  def increase_speed(speed)
    @speed = speed
  end

  def reduce_speed
    @speed = 0
  end

  def add_carriages
    @carriages_quantity += 1 if @speed == 0
  end

  def delete_carriages
    @carriages_quantity -= 1 if @speed == 0
  end

  def trains_type(type)
    puts @trains.count if @type == "cargo"
    puts @trains.count if @type == "passenger"
  end

  def route(route)
    @route = route
  end

  def departure
    @departure_station = @route[0]
  end

  def move(station)
    @station = station
  end

  def stations
    @current_station = @station
    @previous_station
    @next_station
  end
end
