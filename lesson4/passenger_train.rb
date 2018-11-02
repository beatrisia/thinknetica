require_relative 'train'

class PassengerTrain < Train

  def initialize(number, type = "passenger")
    super
  end

  def add_car(car)
    super && car.passenger_car
  end

  def delete_car(car)
    super && car.passenger_car
  end

end
