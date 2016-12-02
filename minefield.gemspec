# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "minefield/version"

Gem::Specification.new do |s|
  s.name        = "minefield"
  s.version     = Minefield::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Csaba S. Nemeth"]
  s.email       = "cnemeth9@gmail.com"

  s.date        = "2016-12-01"
  s.summary     = "Field of mines processing in Ruby"
  s.description = "The program produces an output file showing which mine in the list triggers the most explosions in the fewest number of time intervals, including identifying the mine that triggers the most intense explosions."
  s.homepage    = "https://github.com/cnemeth/minefield"

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.executables   = Dir["bin/*"].map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.licenses = ["MIT"]

  s.required_ruby_version = "~> 2.3.3"
  s.required_rubygems_version = ">= 2.6.8"

  s.add_dependency "rubytree"#, "0.9.7"

  s.add_development_dependency "bundler", "~> 1.13"
  s.add_development_dependency "rake", "~> 11.3"
  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency "pry-byebug", "~> 3.4"
  s.add_development_dependency "rspec", "3.5"
  s.add_development_dependency "guard", "2.14"
  s.add_development_dependency "guard-rspec", "4.7"
  s.add_development_dependency "faker", "1.6"
  s.add_development_dependency "awesome_print", "~> 1.7"
  s.add_development_dependency "timecop", "~> 0.8"
  s.add_development_dependency "simplecov", "~> 0.12"
end

