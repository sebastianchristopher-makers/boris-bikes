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
    raise "#{self.class.name} is full!" if full?
    @bikes << @location.release_bike
  end
  def deliver_bike
    raise "#{self.class.name} is empty!" if empty?
    @location.dock(@bikes.pop)
  end

  private
  def full?
    @bikes.size == @capacity
  end
  def empty?
    @bikes.size == 0
  end
end
