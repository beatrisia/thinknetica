require_relative 'train'

class PassengerTrain < Train

  def initialize(number, type = "passenger")
    super
  end

  def add_car(car)
    super && car.type == "passenger"
  end
end
