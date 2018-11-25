module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  @instances = 0

  module ClassMethods
    attr_reader :instances
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.instances += 1
    end
  end
end
