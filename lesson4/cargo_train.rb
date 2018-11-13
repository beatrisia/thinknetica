require_relative 'train'

class CargoTrain < Train

  def initialize(number)
    super(number, "cargo")
  end

  def add_car(car)
    if car.type = "cargo"
      super
    end
  end
end
