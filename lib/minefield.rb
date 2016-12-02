require_relative '../lib/minefield/reader'
require_relative '../lib/minefield/writer'
require_relative '../lib/minefield/validator'
require_relative '../lib/minefield/processor'
require_relative '../lib/minefield/mine'

module Minefield
  def self.process(file)
    LOGGER.info("Processing file: #{file}")
    data = Minefield::Reader.new.read(file)
    raise RuntimeError, "Unable to process file" if data.empty?
    raise RuntimeError, "Unable to process data" unless Minefield::Validator.new(data).valid?

    result = Minefield::Processor.new(data).process
    Minefield::Writer.new.write(result)
  end
end
