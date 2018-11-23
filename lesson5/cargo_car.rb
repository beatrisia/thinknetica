require_relative 'car'

class CargoCar < Car
  def initialize(number)
    super(number, "cargo")
  end
end
