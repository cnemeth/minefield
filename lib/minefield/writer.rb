require 'awesome_print'
require 'fileutils'

module Minefield
  class Writer
    attr_reader :base, :dir, :ext

    def initialize(options={})
      @base = options[:base] || 'result'
      @dir = options[:dir] || 'tmp/results'
      @ext = options[:ext] || '.txt'
    end

    def write(data)
      FileUtils.mkdir_p(dir) unless File.exist?(dir)
      file = timestamp_file
      LOGGER.info("Writing output file ... #{file}")
      File.open(file, 'w') { |f| f.write(JSON.pretty_generate(format(data))) }
    end

    private

    def format(data)
      output = {}
      node = data.is_a?(Array) ? data.first : data
      root = node.is_root? ? node : find_root(node)
      output[:root_node] = root.name
      output[:content] =  root.content
      output[:json_class] = root.class
      output[:child_nodes] = data

      output
    end

    def find_root(node)
      while node.parent
        node = node.parent
      end
      node
    end

    def timestamp_file
      File.expand_path("#{base}_#{time_stamp}#{ext}", dir)
    end

    def time_stamp
      Time.now.strftime("%FT%T%:z")
    end
  end
end
