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
    current_station.arrive(self)
  end

  def forward
    if next_station
      @station += 1
      current_station.arrive(self)
      previous_station.depart(self)
    end
  end

  def backward
    if @station >= 1
      @station -= 1
      current_station.arrive(self)
      next_station.depart(self)
    end
  end

  def current_station
    @route.stations[@station]
  end

  def previous_station
    @route.stations[@station - 1] if current_station != @route.first_station
  end

  def next_station
    @route.stations[@station + 1] if current_station != @route.last_station
  end
end
