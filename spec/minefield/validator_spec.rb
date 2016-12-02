require 'spec_helper'

RSpec.describe Minefield::Validator do
  describe 'with valid data'do
    let(:data) {
      [
        [ 1, 1, 1],
        [ 2, 2, 1],
        [ 3, -4, 1],
        [ 0, 1, 1],
        [ 1, 2, 1],
        [ 5, 4, 1],
        [ -3, -3, 1],
        [ -2, -1, 1],
        [ -1, -1, 1],
        [ 10, 6, 1],
        [ 9, -3, 5],
        [ -4, -4, 1],
        [ -3, 1, 1],
        [ -10, 3, 5],
        [ -2, 1, 3],
        [ 0, 0, 2],
        [ 1, 0, 3],
        [ 1, 7, 2]
      ]
    }

    it 'returns true'do
      expect(Minefield::Validator.new(data).valid?).to be true
    end
  end

  describe 'with invalid data' do
    context 'with some non-iteger data' do
      let(:data) {
        [
          ['a', 1, 'c'],
          [2, 2, 3]
        ]
      }

      it 'returns false'do
        expect(Minefield::Validator.new(data).valid?).to be false
      end
    end

    context 'with some missing values' do
      let(:data) {
        [
          [1, 1],
          [2, 2, 3]
        ]
      }

      it 'returns false'do
        expect(Minefield::Validator.new(data).valid?).to be false
      end
    end
  end
end
