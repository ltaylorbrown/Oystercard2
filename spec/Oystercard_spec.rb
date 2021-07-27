require 'Oystercard'

describe Oystercard do

  let(:station){double :station}

  it 'default balance of 0' do
    expect(subject.balance).to eq 0
  end 

  it 'can respond to top_up' do 
    expect(subject).to respond_to(:top_up).with(1).argument
  end

  it 'can top_up card with new balance' do 
    expect{ subject.top_up(10)}.to change {subject.balance}.by(10)
  end 

  it 'throws error when exceeding maximum balance' do
    subject.top_up(90)
    expect{ subject.top_up(5)}.to raise_error 'Maximum balance exceeded'
  end

  it 'is initially not in journey?' do 
    expect(subject).not_to be_in_journey
  end 

  it 'is user in journey?' do
    subject.top_up(50)
    subject.touch_in(station)
    expect(subject).to be_in_journey
  end

 it 'can touch out' do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it '@balance must be at least 1 to touch_in' do
    subject.top_up(0)
    expect{ subject.touch_in(station) }.to raise_error 'You cannot ride - you broke'
  end 

  it 'fare deducted once journey complete' do 
    subject.top_up(50)
    subject.touch_in(station)
    expect { subject.touch_out }.to change {subject.balance}.by(-Oystercard::MINIMUM_FARE)
  end 

  it 'remember the entry station after touch_in' do
    subject.top_up(50)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station 
  end 



end 
