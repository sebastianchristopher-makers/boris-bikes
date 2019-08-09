require 'bike'

describe Bike do
  it 'returns true or false from method #working?' do
    expect(subject.working?).to be(true).or be(false)
  end
  it 'returns true from method #working? if bike is working' do
    expect(subject).to be_working
  end
  it 'can report bike as broken' do
    subject.report_broken
    expect(subject).to_not be_working
  end
  it 'can be fixed' do
    subject.report_broken
    subject.fix_bike
    expect(subject).to be_working
  end
end
