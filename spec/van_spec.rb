require 'van'

describe Van do
  let(:bike) { double(:bike) }
  let(:docking_station) { double(:docking_station, release_bike: bike) }

  it 'has a default capacity' do
    expect(subject.capacity).to eq(Van::DEFAULT_CAPACITY)
  end
  it 'can\'t excede its capacity' do
    full_van = Van.new(0)
    full_van.drive_to(docking_station)
    expect { full_van.collect_bike(full_van.location.release_bike) }.to raise_error("Van is full!")
  end
  it 'can\'t release bikes if it has none' do
    empty_van = Van.new(0)
    empty_van.drive_to(docking_station)
    expect { empty_van.deliver_bike }.to raise_error("Van is empty!")
  end
  it 'can move from one location to another' do
    subject.drive_to(docking_station)
    expect(subject.location).to eq(docking_station)
  end

  it 'can collect bikes from docking stations' do
    subject.drive_to(docking_station)
    subject.collect_bike(subject.location.release_bike)
    expect(subject.bikes).to include(bike)
  end
  it 'can deliver bikes to garages' do
    garage = double(:garage)
    allow(garage).to receive(:dock)
    subject.drive_to(docking_station)
    subject.collect_bike(subject.location.release_bike)
    subject.drive_to(garage)
    subject.deliver_bike
    expect(subject.bikes).to_not include(bike)
  end
  it 'can store bikes (and say how many)' do
    subject.drive_to(docking_station)
    subject.collect_bike(subject.location.release_bike)
    expect(subject.bikes.size).to eq(1)
  end
end
