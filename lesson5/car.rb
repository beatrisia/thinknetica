class Car
  include Manufacturer

  attr_reader :number, :type

  def initialize(number, type)
    @number = number
    @type = type
  end
end
