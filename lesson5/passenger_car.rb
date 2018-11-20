require_relative 'car'

class PassengerCar < Car

  def initialize(number)
   super(number, "passenger")
  end
end
