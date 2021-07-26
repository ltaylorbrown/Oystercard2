require 'Oystercard'

describe Oystercard do

  it 'default balance of 0' do
    expect(subject.balance).to eq 0
  end 

  it 'top_up card' do 
    expect(subject).to respond_to(:top_up).with(1).argument
  end
  
end 
