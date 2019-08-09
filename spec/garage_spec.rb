require 'garage'

describe Garage do
  let(:bike) { double(:bike) }
  let(:van) { double(:van) }

  it 'accepts bikes' do
    subject.dock(bike)
    expect(subject.bikes).to include(bike)
  end
  it 'releases bikes' do
    subject.dock(bike)
    subject.release_bike
    expect(subject.bikes).to_not include(bike)
  end
  it 'has a method called #fix_bike accepting one argument' do
    subject.dock(bike)
    expect(subject).to respond_to(:fix_bike).with(1).argument
  end
  it 'fixes broken bikes' do
    allow(bike).to receive(:report_broken).and_return(false)
    allow(bike).to receive(:fix_bike).and_return(true)
    allow(bike).to receive(:working?).and_return(true)

    bike.report_broken
    subject.fix_bike(bike)
    expect(bike).to be_working
  end
  it 'has a default capacity' do
    expect(subject.capacity).to eq(Garage::DEFAULT_CAPACITY)
  end
end
