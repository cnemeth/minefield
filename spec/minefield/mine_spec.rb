require 'spec_helper'

RSpec.describe Minefield::Mine do
  describe '#related' do
    describe 'with raleted nodes' do
      let(:current) { Minefield::Mine.new(1, 1, 5) }
      let(:other) { Minefield::Mine.new(2,3,3) }

      it 'returns true' do
        expect(current.related?(other)).to be true
      end
    end

    describe 'with unraleted nodes' do
      let(:current) { Minefield::Mine.new(1, 1, 1) }
      let(:other) { Minefield::Mine.new(2,3,3) }

      it 'returns true' do
        expect(current.related?(other)).to be false
      end
    end
  end

  describe 'distance' do
    let(:current) { Minefield::Mine.new(1, 1, 1) }
    let(:other) { Minefield::Mine.new(1,2,1) }

    it 'returns the Euclidian distance between two mines' do
      expect(current.distance(other)).to eq 1
    end
  end

  describe 'name' do
    let(:mine) { Minefield::Mine.new(1, -1, 1) }

    it "returns the string 'MINE_1_-1_1'" do
      expect(mine.name).to eq 'MINE_1_-1_1'
    end
  end
end
