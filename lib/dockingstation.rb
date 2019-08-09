# require 'pry'
require_relative './bike'
require_relative './van'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "#{self.class.name} is empty!" if empty?
    # return @bikes.pop
    @bikes.each_with_index { |bike, index|
      return @bikes.delete_at(index) if bike.working?
    }
    raise "All bikes are broken!"
  end

  def dock(bike_to_add)
    raise "#{self.class.name} is full!" if full?
    @bikes << bike_to_add
  end

  private
  def empty?
    @bikes.size == 0
  end
  def full?
    @bikes.size == @capacity
  end
end

# binding.pry
