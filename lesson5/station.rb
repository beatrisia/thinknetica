require_relative 'instance_counter'

class Station
  include InstanceCounter

  @all = []

  class << self; attr_reader :all; end

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    self.class.all << self
    register_instance
  end

  def arrive(train)
    @trains << train
  end

  def depart(train)
    @trains.delete(train)
  end

  def trains_type(type)
    @trains.count { |train| train.type == type }
  end
end
