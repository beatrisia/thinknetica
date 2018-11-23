require_relative 'instance_counter'

class Station
  include InstanceCounter

  @all = 0

  class << self; attr_accessor :all; end

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    self.class.all += 1
    self.register_instance
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
