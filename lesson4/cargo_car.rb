require_relative 'car'

class CargoCar < Car

  def initialize(number)
    super
    @type = "cargo"
  end
end
