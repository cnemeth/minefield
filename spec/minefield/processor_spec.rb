require 'spec_helper'

RSpec.describe Minefield::Processor do
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

  it 'processes data' do
    expect{
      Minefield::Processor.new(data).process
    }.to_not raise_error
  end

  before do
    @result = Minefield::Processor.new(data).process
  end

  it 'returns an array of Tree::TreeNode' do
    expect(@result).to be_a Array
    expect(@result.first).to be_a Tree::TreeNode
  end

  it 'finds which mine in the list triggers the most explosions in the fewest number of time intervals' do
    node = @result.is_a?(Array) ? @result.first : tree
    root = node.is_root? ? node : find_root(node)
    x = root.content.x_coord
    y = root.content.y_coord
    r = root.content.radius
    expect([x, y, r]).to eq [1, 0, 3]
  end

  private

  def find_root(node)
    while node.parent
      node = node.parent
    end
    node
  end
end
