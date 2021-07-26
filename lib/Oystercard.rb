class Oystercard
attr_reader :balance 

DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    
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

  end

  def touch_out
    
  end

  def in_journey?
    false
  end 

end


