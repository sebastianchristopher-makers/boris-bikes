require 'dockingstation'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bicycle) { Bike.new }

  context '#release_bike' do
    it 'responds to #release_bike' do
      docking_station.dock(Bike.new)
      expect(docking_station).to respond_to(:release_bike)
    end
    it 'responds to #release_bike by returning a Bike' do
      docking_station.dock(Bike.new)
      expect(docking_station.release_bike).to be_kind_of(Bike)
    end
    it 'responds to #release_bike by returning a working Bike' do
      docking_station.dock(Bike.new)
      expect(docking_station.release_bike.working?).to be(true)
    end
  end

  context 'capacity' do
    it 'initializes with a default capacity of DEFAULT_CAPACITY' do
      expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
    it 'initializes with a value of 40 if passed 40' do
      docking_station = DockingStation.new(40)
      expect(docking_station.capacity).to eq(40)
    end
    it 'can\'t dock over capacity' do
      described_class::DEFAULT_CAPACITY.times { docking_station.dock(Bike.new) }
      expect { docking_station.dock(Bike.new) }.to raise_error("This dock is full!")
    end
    it 'won\'t release bikes if there aren\'t any' do
      expect { docking_station.release_bike }.to raise_error("No bikes for you!")
    end
  end

  it 'responds to #dock with 1 argument' do
    expect(docking_station).to respond_to(:dock).with(1).argument
  end

  it 'has a method to show stored bikes' do
    docking_station.dock(bicycle)
    expect(docking_station.bikes).to eq([bicycle])
  end

  context 'broken bikes' do
    it 'lets the user report as bike as broken when docking, whether it\'s broken or not' do
      docking_station.dock(bicycle, false)
      expect(bicycle.working?).to be(false)
    end
    it 'won\'t let the user borrow a broken bike' do
      docking_station.dock(Bike.new, false)
      expect { docking_station.release_bike }.to raise_error("All bikes are broken!")
    end
    it 'cycles through broken bikes until the user can borrow a working one' do
      2.times { docking_station.dock(Bike.new, false) }
      docking_station.dock(Bike.new)
      expect(docking_station.release_bike.working?).to be(true)
    end
  end

end
