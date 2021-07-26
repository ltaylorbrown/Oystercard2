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

end 
