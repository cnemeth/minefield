require 'awesome_print'

module Minefield
  class Printer
    attr_reader :options

    def initialize(options={})
      @options = options
    end

    def print_table
      ap "Minefield::Printer#print  ...  #{options}"
    end
  end
end

