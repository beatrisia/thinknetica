class Train
  attr_reader :cars, :speed, :type

  def initialize(number, type)
    @number = number
    @type = type
    @cars = []
  end

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    @speed -= speed if @speed > 0 && @speed >= speed
  end

  def add_car(car)
    @cars << car if @speed == 0
  end

  def delete_car(car)
    @cars.delete(car) if @speed == 0 && self.include?(car)
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
