require 'spec_helper'

RSpec.describe Minefield do
  describe 'success' do
    let(:file) { File.expand_path('example_mines.txt', 'spec/fixtures') }

    it 'runs without error' do
      expect{
        Minefield.process(file)
      }.to_not raise_error
    end
  end

  describe 'failure' do
    describe 'with non-existent file' do
      let(:file) { 'blah' }

      it 'raises and error' do
        expect{
          Minefield.process(file)
        }.to raise_error(/Unable to process file/)
      end
    end

    describe 'with empty file' do
      let(:file) { File.expand_path('empty.txt', 'spec/fixtures') }

      it 'raises and error' do
        expect{
          Minefield.process(file)
        }.to raise_error(/Unable to process file/)
      end
    end

    describe 'with file that contains invalid data' do
      let(:file) { File.expand_path('invalid_mines.txt', 'spec/fixtures') }

      it 'raises and error' do
        expect{
          Minefield.process(file)
        }.to raise_error(/Unable to process data/)
      end
    end
  end
end
