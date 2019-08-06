# require 'pry'
require_relative './bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    raise "No bikes for you!" if empty?
    @bikes.pop
  end

  def dock(bike_to_add)
    raise "This dock is full!" if full?
    @bikes.push(bike_to_add)
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
