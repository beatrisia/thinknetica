class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrive(train)
    @trains << train
  end

  def depart(train)
    @trains.delete(train)
  end

  def trains_type(type)
    @trains.count { |train| train.type == type }
  end
end

class Route
  attr_reader :stations

  def initialize(departure_station, arrival_station)
    @stations = [departure_station, arrival_station]
  end

  def add(station)
    @stations.insert(-2, station)
  end

  def delete(station)
    @stations.delete(station) if station != @stations[0] && station != @stations[-1]
  end

  def show
    @stations.each { |station| puts station }
  end
end

class Train
  attr_reader :carriages, :speed, :type

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
    @speed = 0
  end

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    @speed -= speed if @speed > 0 && @speed >= speed
  end

  def add_carriages
    @carriages += 1 if @speed == 0
  end

  def delete_carriages
    @carriages -= 1 if @speed == 0 && @carriages >= 1
  end

  def route(route)
    @route = route
    @station = 0
    @route.stations[@station].arrive(self)
  end

  def forward
    @station += 1 if @route.stations[@station] != @route.stations[-1]
    @route.stations[@station].arrive(self)
  end

  def backward
    @station -= 1 if @station >= 1
    @route.stations[@station].arrive(self)
  end

  def current_station
    @route.stations[@station]
  end

  def previous_station
    @route.stations[@station-1] if @station >= 1
  end

  def next_station
    @route.stations[@station+1] if @route.stations[@station] != @route.stations[-1]
  end
end
