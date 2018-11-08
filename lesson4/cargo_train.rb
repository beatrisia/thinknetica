require_relative 'train'

class CargoTrain < Train

  def initialize(number)
    super
    @type = "cargo"
  end

  def add_car(car)
    @cars << car if @speed == 0 && car.type = "cargo"
  end
end
