# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shiftplanning/version'

Gem::Specification.new do |spec|
  spec.name          = "shiftplanning"
  spec.version       = ShiftPlanning::VERSION
  spec.authors       = ["Morgan Miller"]
  spec.email         = ["m.miller722@gmail.com"]
  spec.summary       = %q{A gem for interfacing with the Shift Planning API - changing for test}
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = [".gitignore", ".rspec", ".travis.yml", "Gemfile", "README.md", "Rakefile", "bin/console", "bin/setup", "lib/shiftplanning.rb", "lib/shiftplanning/client.rb", "lib/shiftplanning/response_error.rb", "lib/shiftplanning/version.rb", "shiftplanning.gemspec"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "httparty", "~>0.13.7"
  spec.add_development_dependency "pry"
end
