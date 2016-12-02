module Minefield
  class Validator
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def valid?
      array_of_arrays_of_integers?
    end

    private

    def array_of_arrays_of_integers?
      array? && array_of_arrays? && all_integers? && array_of_arrays_sizes_3?
    end

    def array?
      data.is_a?(Array)
    end

    def array_of_arrays?
      types = data.map(&:class).uniq
      types.count == 1 && types.first == Array
    end

    def array_of_arrays_sizes_3?
      counts = data.map(&:count).uniq
      counts.count == 1 && counts.first == 3
    end

    def all_integers?
      types = data.flatten.map(&:class).uniq
      types.count == 1 && types.first == Fixnum
    end
  end
end
