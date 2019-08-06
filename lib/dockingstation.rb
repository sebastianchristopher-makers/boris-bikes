# require 'pry'
require_relative './bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity

  def initialize
    @capacity = 0
  end

  def release_bike
    raise "No bikes for you!" if @capacity == 0
    @capacity -= 1
    @bikes
  end

  def dock(bike_to_add)
    raise "This dock is full!" if @capacity == 20
    @capacity += 1
    @bikes = bike_to_add
  end
end

# binding.pry
