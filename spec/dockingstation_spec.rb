require 'dockingstation'

describe DockingStation do
  it 'responds to release_bike' do
    docking_station = DockingStation.new
    expect(docking_station).to respond_to(:release_bike)
  end

  it 'gets a bike' do
    docking_station = DockingStation.new
    bicycle = docking_station.release_bike
    expect(bicycle).to be_kind_of(Bike)
  end

  it 'release a working bike' do
    docking_station = DockingStation.new
    bicycle = docking_station.release_bike
    expect(bicycle.working?).to be(true)
  end

  it 'responds to dock' do
    docking_station = DockingStation.new
    bicycle = docking_station.release_bike
    expect(docking_station).to respond_to(:dock)
  end

  it 'should initialize with an empty array called bikes' do
    docking_station = DockingStation.new
    expect(docking_station.bikes).to eq( [] )
  end

  it 'should take an instance of Bike as an argument and store it' do
    docking_station = DockingStation.new
    bicycle = docking_station.release_bike
    docking_station.dock(bicycle)
    expect(docking_station.bikes).to include(bicycle)
  end

  # it 'won\'t release bikes if there aren\'t any' do
  #
  # end
end
