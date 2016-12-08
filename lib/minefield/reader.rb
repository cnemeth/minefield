require 'awesome_print'

module Minefield
  class Reader
    def initialize; end

    def read(file)
      return [] unless file && File.exist?(file)
      read_file(file)
    end

    private

    def read_file(file)
      data = []
      File.open(file, "r") do |f|
        f.each_line do |line|
          data << line.chomp.split(' ').map(&:to_i)
        end
      end

      data
    end
  end
end

