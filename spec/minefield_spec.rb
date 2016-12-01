require 'spec_helper'

RSpec.describe Minefield do
  let(:mines) { '1 2 3' }

  it 'runs without error' do
    expect{
      Minefield.print(mines)
    }.to_not raise_error
  end
end

