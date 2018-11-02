require_relative 'car'

class CargoCar < Car

  def initialize(car_type = "cargo")
    super
  end

  def cargo_car
    @car_type
  end
end
