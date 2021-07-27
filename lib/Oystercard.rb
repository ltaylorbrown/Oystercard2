class Oystercard
attr_reader :balance 
attr_accessor :journey

DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = journey
  end

  def top_up(money)
    @balance = @balance += money
    fail 'Maximum balance exceeded' if @balance > MAXIMUM_BALANCE 
  end 

  def deduct(fare)
   @balance = @balance -= fare
  end

  def touch_in
    # fail 'You cannot ride - you broke' if @balance < 1
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    return @journey ? true : false
  end 

end


