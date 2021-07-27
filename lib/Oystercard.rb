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
    raise 'Maximum balance exceeded' if @balance > MAXIMUM_BALANCE 
  end 

  def deduct(fare)
   @balance = @balance -= fare
  end

  def touch_in
    raise 'You cannot ride - you broke' if no_funds

    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    return @journey ? true : false
  end 

  private 

  def no_funds
    return @balance == DEFAULT_BALANCE ? true : false
  end
  
end


