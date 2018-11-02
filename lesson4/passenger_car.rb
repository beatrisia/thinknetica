require_relative 'car'

class PassengerCar < Car

  def initialize(car_type = "passenger")
    super
  end

  def passenger_car
    @car_type
  end
end
