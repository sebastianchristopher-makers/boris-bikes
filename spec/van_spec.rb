require 'van'

describe Van do
  let(:docking_station_1) { double(:docking_station_1) }

  let(:bike) { double(:bike) }
  it 'can move from one location to another' do
    subject.drive_to(docking_station_1)
    expect(subject.location).to eq(docking_station_1)
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq(Van::DEFAULT_CAPACITY)
  end
  it 'can collect bikes from docking stations' do
    allow(docking_station_1).to receive(:release_bike).and_return(bike)
    subject.drive_to(docking_station_1)
    subject.collect_bike
    expect(subject.bikes).to include(bike)
  end

  # it 'can deliver bikes to docking stations' do

end
