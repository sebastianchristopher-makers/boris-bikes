require 'bike'

describe Bike do
  it 'responds to the method working?' do
    bike = Bike.new
    expect(bike).to respond_to(:working?)
  end
end
