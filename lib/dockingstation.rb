require_relative './bike'

class DockingStation
  # attr_reader :bikes
  def bikes
    return @bikes
  end

  def initialize
    @bikes = []
  end

  def release_bike
    return Bike.new
  end

  def dock(bike_to_add)
    @bikes.push(bike_to_add)
  end
end
