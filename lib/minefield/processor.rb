module Minefield
  class Processor
    attr_accessor :mines, :trees, :scores

    TreeScore = Struct.new(:name, :score, :size, :height)

    def initialize(data)
      @mines = create_mines(data)
      @trees = {}
      @scores = []
    end

    def process
      LOGGER.info("Processing data ... ")
      build_trees
      winning_tree
    end

    private

    def create_mines(data)
      data.map { |d| Mine.new(d[0], d[1], d[2]) }
    end

    def build_trees
      mines.each do |mine|
        root =  Tree::TreeNode.new(mine.name, mine)
        tree = build_tree(root, mine, mines)
        score(tree)
        trees[mine.name.to_sym] = tree
      end
      trees
    end

    def build_tree(root, mine, mines)
      names = node_names(root)
      mines.each do |m|
        next if m == mine || names.include?(m.name)
        if mine.related?(m)
          root << Tree::TreeNode.new(m.name, m)
        end
      end

      if root.children.any?
        root.children.each do |child|
          build_tree(child, child.content, mines)
        end
      else
        return root
      end
    end

    def node_names(node)
      return node.name if node.is_root?

      root = find_root(node)
      root.map(&:name)
    end

    def find_root(node)
      while node.parent
        node = node.parent
      end
      node
    end

    def score(tree)
      node = tree.is_a?(Array) ? tree.first : tree
      root = node.is_root? ? node : find_root(node)
      size = root.size
      height = root.node_height + 1
      score = size / height.to_f
      scores << TreeScore.new(root.name, score, size, height)
    end

    def winning_tree
      name = scores.select{|s| s.name if s.score == scores.map(&:score).max}.first.name
      trees[name.to_sym]
    end
  end
end
