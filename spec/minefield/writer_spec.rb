require 'spec_helper'
require 'fileutils'

RSpec.describe Minefield::Writer do
  let(:dir) { 'spec/fixtures/results' }
  let(:options) {
    {
      dir: dir
    }
  }

  before do
    @tree1 = Tree::TreeNode.new('mine1', Minefield::Mine.new(1,1,3))
    @tree1 << Tree::TreeNode.new('mine2', Minefield::Mine.new(2,2,3)) << Tree::TreeNode.new('mine5', Minefield::Mine.new(3,3,1))
    @tree1 << Tree::TreeNode.new('mine3', Minefield::Mine.new(-2,-2,1))
    @tree1 << Tree::TreeNode.new('mine4', Minefield::Mine.new(-1,-1,1))

    @tree2 = Tree::TreeNode.new('mine6', Minefield::Mine.new(4,5,6))
    @tree2 << Tree::TreeNode.new('mine7', Minefield::Mine.new(7,8,3))
    @tree2 << Tree::TreeNode.new('mine8', Minefield::Mine.new(5,6,1))

    @trees = [@tree1, @tree2]

    FileUtils.rm_rf dir if File.exist?(dir)
    Minefield::Writer.new(options).write(@trees)
  end

  it 'does not raise error' do
    expect{
      Minefield::Writer.new(options).write(@trees)
    }.to_not raise_error
  end

  it 'creates directory if it does not exist' do
    expect(File.exist?(dir)).to be true
  end

  it 'writes result to file' do
    files = Dir.entries(dir)
    expect(File.size?(File.join(dir, "#{files.last}"))).to_not be nil
  end
end
