require_relative './bike'

class Garage
  DEFAULT_CAPACITY = 40
  attr_accessor :bikes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  def dock(bike)
    # raise "We only accept bikes from vans!" if !from.is_a?(Van)
    @bikes << bike
  end
  def release_bike
    @bikes.pop
  end
  def fix_bike(bike)
    bike.fix_bike
  end
end
