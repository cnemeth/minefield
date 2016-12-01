require 'rubygems'
require 'bundler'
require "bundler/gem_tasks"
require 'rake'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

desc 'Default: run the specs'
task default: %w(spec:unit)

namespace :spec do
  desc "Run unit specs"
  RSpec::Core::RakeTask.new('unit') do |t|
    t.pattern = 'spec/{*_spec.rb,minefield/**/*_spec.rb}'
  end
end

