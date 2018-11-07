require_relative 'train'

class CargoTrain < Train

  def initialize(number)
    super
    @type = "cargo"
  end

  def add_car(car)
    super && car.type = "cargo"
  end
end
