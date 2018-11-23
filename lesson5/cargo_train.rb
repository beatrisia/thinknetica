require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    super(number, "cargo")
  end

  def add_car(car)
    super if car.type == "cargo"
  end
end
