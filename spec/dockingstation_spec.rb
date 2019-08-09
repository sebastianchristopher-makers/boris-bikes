require 'dockingstation'

describe DockingStation do
  let(:docking_station) { DockingStation.new }
  let(:bicycle) { Bike.new }
  let(:dbl_bike) { double :bike }
  # context 'test doubles' do
  #   it 'equals itself' do
  #     copy_of_dbl = dbl_bike
  #     expect(copy_of_dbl).to eq(dbl_bike)
  #   end
  #   it 'doesnt equal a new double' do
  #     different_dbl = double(:bike)
  #     expect(different_dbl).to_not eq(dbl_bike)
  #   end
  # end
  context '#release_bike' do
    it 'responds to #release_bike' do
      docking_station.dock(dbl_bike)
      expect(docking_station).to respond_to(:release_bike)
    end
    xit 'responds to #release_bike by returning a Bike' do
      #not sure how to double this???
      docking_station.dock(bicycle)
      expect(docking_station.release_bike).to be_kind_of(Bike)
    end
    it 'responds to #release_bike by returning a working Bike' do
      allow(dbl_bike).to receive(:working?).and_return(true)
      docking_station.dock(dbl_bike)
      released_bike = docking_station.release_bike
      expect(released_bike).to be_working
    end
  end

  context 'capacity' do
    it 'initializes with a default capacity of DEFAULT_CAPACITY' do
      expect(docking_station.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end
    it 'initializes with a value of 40 if passed 40' do
      big_docking_station = DockingStation.new(40)
      expect(big_docking_station.capacity).to eq(40)
    end
    it 'can\'t dock over capacity' do
      described_class::DEFAULT_CAPACITY.times { docking_station.dock(dbl_bike) }
      expect { docking_station.dock(dbl_bike) }.to raise_error("This dock is full!")
    end
    it 'won\'t release bikes if there aren\'t any' do
      expect { docking_station.release_bike }.to raise_error("No bikes for you!")
    end
  end

  it 'responds to #dock with 1 argument' do
    expect(docking_station).to respond_to(:dock).with(1).argument
  end

  it 'has a method to show stored bikes' do
    bike1 = double(:bike)
    bike2 = double(:bike)
    docking_station.dock(bike1)
    docking_station.dock(bike2)
    expect(docking_station.bikes).to eq([bike1, bike2])
  end

  context 'broken bikes' do
    it 'lets the user report as bike as broken' do
      allow(dbl_bike).to receive(:report_broken)
      allow(dbl_bike).to receive(:working?).and_return(false)
      dbl_bike.report_broken
      expect(dbl_bike).to_not be_working
    end
    it 'lets the user dock a bike whether it\'s broken or not' do
      allow(dbl_bike).to receive(:report_broken)
      dbl_bike.report_broken
      docking_station.dock(dbl_bike)
      expect(docking_station.bikes).to include(dbl_bike)
    end
    it 'won\'t let the user borrow a broken bike' do
      allow(dbl_bike).to receive(:report_broken)
      dbl_bike.report_broken
      allow(dbl_bike).to receive(:working?).and_return(false)
      docking_station.dock(dbl_bike)
      expect { docking_station.release_bike }.to raise_error("All bikes are broken!")
    end
    it 'cycles through broken bikes until the user can borrow a working one' do
      # broken_bike = double(:broken_bike)
      # allow(broken_bike).to receive(:report_broken)
      # allow(broken_bike).to receive(:working?).and_return(false)
      broken_bike = double(:broken_bike, working?: false)
      allow(broken_bike).to receive(:report_broken)
      allow(dbl_bike).to receive(:working?).and_return(true)
      5.times {
        broken_bike.report_broken
        docking_station.dock(broken_bike)
      }
      docking_station.dock(dbl_bike)
      expect(docking_station.release_bike).to eq(dbl_bike)
    end
  end

end
