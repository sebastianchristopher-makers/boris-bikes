require_relative './bike'

class Garage
  attr_accessor :bikes
  def initialize
    @bikes = []
  end
  def take_bike(bike)
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
