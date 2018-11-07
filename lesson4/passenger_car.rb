require_relative 'car'

class PassengerCar < Car

  def initialize(number)
    super
    @type = "passenger"
  end
end
