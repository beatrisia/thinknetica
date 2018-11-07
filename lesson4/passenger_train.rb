require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super
    @type = "passenger"
  end

  def add_car(car)
    super && car.type == "passenger"
  end
end
