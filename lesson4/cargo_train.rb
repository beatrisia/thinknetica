require_relative 'train'

class CargoTrain < Train

  def initialize(number, type = "cargo")
    super
  end

  def add_car(car)
    super && car.cargo_car
  end

  def delete_car(car)
    super && car.cargo_car
  end

end
