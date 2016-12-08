require 'spec_helper'

RSpec.describe Minefield::Reader do
  describe 'success' do
    let(:file) { File.expand_path('example_mines.txt', 'spec/fixtures') }

    before do
      @data = Minefield::Reader.new.read(file)
    end

    it 'returns an array' do
      expect(@data).to be_a_kind_of Array
    end

    it 'returns an array of arrays' do
      expect(@data.first).to be_a_kind_of Array
    end

    it 'array size matches the number of rows in the data file' do
      line_count = `wc -l "#{file}"`.strip.split(' ')[0].to_i
      expect(@data.count).to eq line_count
    end

    it 'the inner arrays each comprise 3 values' do
      counts = @data.map{|d| d.size}.uniq
      expect(counts).to match_array [3]
    end

    it 'the data in the arrays is type Fixnum' do
      types = @data.flatten.map{|d| d.class}.uniq
      expect(types).to match_array [Fixnum]
    end
  end


  describe 'failure' do
    describe 'with missing file' do
      let(:file) { 'blah' }

      it 'does not raise IO error' do
        expect{
          Minefield::Reader.new.read(file)
        }.to_not raise_error
      end

      it 'returns an empty array' do
        expect(Minefield::Reader.new.read(file)).to match_array []
      end
    end

    describe 'with nil' do
      let(:file) { nil }

      it 'does not raise IO error' do
        expect{
          Minefield::Reader.new.read(file)
        }.to_not raise_error
      end

      it 'returns an empty array' do
        expect(Minefield::Reader.new.read(file)).to match_array []
      end
    end
  end
end
