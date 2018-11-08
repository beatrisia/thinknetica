require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super
    @type = "passenger"
  end

  def add_car(car)
    @cars << car if @speed == 0 && car.type == "passenger"
  end
end
