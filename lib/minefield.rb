require_relative '../lib/minefield/printer'

module Minefield
  def self.print(options)
    Minefield::Printer.new(options).print_table
  end
end
