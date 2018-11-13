require_relative 'train'

class PassengerTrain < Train

  def initialize(number)
    super(number, "passenger")
  end

  def add_car(car)
    if car.type == "passenger"
      super
    end
  end
end
