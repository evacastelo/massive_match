# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'massive_match/version'

Gem::Specification.new do |spec|
  spec.name          = "massive_match"
  spec.version       = MassiveMatch::VERSION
  spec.authors       = ["Jake Sower"]
  spec.email         = ["j.sower@asee.org"]
  spec.description   = %q{Match arbitrary sets to each other.}
  spec.summary       = %q{Match arbitrary sets to each other.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "lp_select"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
