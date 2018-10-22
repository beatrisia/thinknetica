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

  def cargo
    @trains.count { |train| train.type == "cargo" }
  end

  def passenger
    @trains.count { |train| train.type == "passenger" }
  end
end

class Route
  def initialize(departure_station, arrival_station)
    @stations = [departure_station, arrival_station]
  end

  def stations
  end

  def add(station)
    @stations << station
  end

  def delete(station)
    @stations.delete(station)
  end

  def show
    @stations.each { |station| puts station }
  end
end

class Train
  attr_accessor :speed, :type
  attr_reader :carriages

  def initialize(number, type, carriages)
    @number = number
    @type = type
    @carriages = carriages
  end

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    @speed -= speed if speed > 0
  end

  def add_carriages
    @carriages += 1 if @speed == 0
  end

  def delete_carriages
    @carriages -= 1 if @speed == 0 && @carriages > 0
  end

  def route(route)
    @route = route.stations
    @departure_station = @route.first
  end

  def move(station)
    @station = station
  end

  def current_station
    @station
  end

  def previous_station
    index = route.index(@station)
    @previous_station = route[index-1] if index > 0
  end

  def next_station
    index = route.index(@station)
    @next_station = route[index+1]
  end
end
