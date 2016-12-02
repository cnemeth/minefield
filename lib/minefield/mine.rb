module Minefield
  class Mine
    attr_reader :name, :x_coord, :y_coord, :radius

    def initialize(x, y, r)
      @name = "MINE_#{x}_#{y}_#{r}"
      @x_coord = x
      @y_coord = y
      @radius = r
    end

    def related?(other)
      distance(other) <= radius
    end

    def distance(other)
      x_distance = other.x_coord - x_coord
      y_distance = other.y_coord - y_coord
      Math.sqrt(x_distance**2 + y_distance**2)
    end
  end
end
