require 'Station'

describe Station do

  it 'what zone the station is in' do
    station = Station.new('Bkyer', 2)
    expect(station.zone).to eq 2
  end 

end