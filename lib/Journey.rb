require 'Station'

class Journey 
attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def entry(station, zone)
    @entry_station = Station.new(station, zone)
  end 

  def exit(station, zone)
    @exit_station = Station.new(station, zone)
  end

end
