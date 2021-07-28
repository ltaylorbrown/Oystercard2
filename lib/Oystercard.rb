class Oystercard
attr_reader :balance 
attr_accessor :journey , :journey_log
attr_reader :entry_station 
attr_reader :exit_station

DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = journey
    @entry_station = nil 
    @exit_station = nil
    @journey_log = []
  end

  def top_up(money)
    @balance = @balance += money
    raise 'Maximum balance exceeded' if @balance > MAXIMUM_BALANCE 
  end 

  def touch_in(station)
    raise 'You cannot ride - you broke' if no_funds
    @journey = true
    @entry_station = station
    journey_log << {entry_station: station}
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    journey_log << {exit_station: station}
    @journey = false
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end 

  private 

  def no_funds
    return @balance <= DEFAULT_BALANCE ? true : false
  end

  def deduct(fare)
   @balance = @balance -= fare
  end 

end
# 

