require 'Oystercard'

describe Oystercard do


  it 'default balance of 0' do
    expect(subject.balance).to eq 0
  end 

  it 'can respond to top_up' do 
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'can respond to deduct' do 
    expect(subject).to respond_to(:deduct).with(1).argument
  end

  it 'can top_up card with new balance' do 
    expect{ subject.top_up(10)}.to change {subject.balance}.by(10)
  end 

  it 'throws error when exceeding maximum balance' do
    subject.top_up(90)
    expect{ subject.top_up(5)}.to raise_error 'Maximum balance exceeded'
  end

  it 'deducts the fare from balance' do 
    subject.top_up(50)
    expect{ subject.deduct(2)}.to change {subject.balance}.by(-2)
  end

  # it 'touches_in for journey' do
  #   expect(subject).to respond_to(:touch_in)
  # end

  # it 'touches_out for journey' do 
  #   expect(subject).to respond_to(:touch_out)
  # end

  it 'is initially not in journey?' do 
    expect(subject).not_to be_in_journey
  end 

  it 'is user in journey?' do
    subject.touch_in
    expect(subject).to be_in_journey
  end

#  it 'can touch out' do
#     subject.touch_in
#     subject.touch_out
#     expect(subject).not_to be_in_journey
#   end

  # it '@balance must be at least 1 to touch_in' do
   
  #   expect {subject.touch_in}.to raise_error 'You cannot ride - you broke'
  # end 
end 
