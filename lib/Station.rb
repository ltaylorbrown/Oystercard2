class Station
attr_reader :zone, :name

  def initialize(station, zone)
    @name = station
    @zone = zone
  end

  def printer
    [@name, @zone]
  end
 
  
end
