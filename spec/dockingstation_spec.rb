require 'dockingstation'

describe DockingStation do
  it 'responds to #release_bike' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'responds to #release_bike by returning a Bike' do
    docking_station = DockingStation.new
    bicycle = Bike.new
    docking_station.dock(bicycle)
    expect(docking_station.release_bike).to be_kind_of(Bike)
  end

  it 'responds to #release_bike by returning a working Bike' do
    docking_station = DockingStation.new
    bicycle = Bike.new
    docking_station.dock(bicycle)
    expect(docking_station.release_bike.working?).to be(true)
  end

  it 'responds to #dock with 1 argument' do
    docking_station = DockingStation.new
    bicycle = Bike.new
    expect(docking_station).to respond_to(:dock).with(1).argument
  end

  it 'returns stored bikes' do
    docking_station = DockingStation.new
    bicycle = Bike.new
    docking_station.dock(bicycle)
    expect(docking_station.bikes).to eq(bicycle)
  end

  it 'won\'t release bikes if there aren\'t any' do
    docking_station = DockingStation.new
    expect { docking_station.release_bike }.to raise_error("No bikes for you!")
  end
end
