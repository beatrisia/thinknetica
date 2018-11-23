require_relative 'train'

class PassengerTrain < Train
  def initialize(number)
    super(number, "passenger")
  end

  def add_car(car)
    super if car.type == "passenger"
  end
end
