$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'minefield'
require 'rake'
require 'rspec'
require 'pry'
require 'pry-byebug'
require 'awesome_print'
require 'faker'
require 'simplecov'
require 'timecop'
require 'tree'
require 'logger'

require 'fileutils'

Dir["spec/fixtures/**/*.rb"].each { |f| require File.expand_path(f) }

using_git = File.exist?(File.expand_path('../../.git/', __FILE__))
require 'bundler/setup' if using_git

SimpleCov.start do
  add_filter "/spec"
  add_filter "/features"
  add_filter "/bin"
  add_filter "/bundle"
end

SimpleCov.at_exit do
  File.open(File.join(SimpleCov.coverage_path, 'coverage_percent.txt'), 'w') do |f|
    f.write SimpleCov.result.covered_percent
  end
  SimpleCov.result.format!
end

LOGGER = Logger.new(STDOUT)

RSpec.configure do |config|
  config.order = :rand
  config.color = true

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.after do
    Timecop.return
  end
end

