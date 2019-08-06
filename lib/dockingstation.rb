# require 'pry'
require_relative './bike'

class DockingStation
  attr_reader :bikes

  def release_bike
    raise "No bikes for you!" if @bikes.nil?
    return Bike.new
  end

  def dock(bike_to_add)
    @bikes = bike_to_add
  end
end

# binding.pry
