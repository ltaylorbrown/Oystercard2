require 'Journey'

describe Journey do

  describe '#entry' do
    it 'returns entry station and zone' do
      train = Journey.new
      expect(train.entry('Wallsend', 3).printer).to eq ['Wallsend', 3]
    end
  end
 
  describe '#exit' do
    it 'returns exit station and zone' do
      train = Journey.new
      expect(train.exit('Tynemouth', 5).printer).to eq ['Tynemouth', 5]
    end
  end
end