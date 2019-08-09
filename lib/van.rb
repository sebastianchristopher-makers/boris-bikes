class Van
  DEFAULT_CAPACITY = 10
  attr_reader :bikes
  attr_reader :capacity
  attr_accessor :location

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  def drive_to(location)
    @location = location
  end
  def collect_bike(bike)
    @bikes << @location.release_bike
  end
  def deliver_bike
    @location.dock(@bikes.pop)
  end
end

#drive_to_garage
# @ location
# def dock_bike
#   @bikes << garage.release_bike if @location == garage
#   @bikes << docking_station.release_bike if @location == dockingstation
