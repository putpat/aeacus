# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aeacus/version'

Gem::Specification.new do |spec|
  spec.name          = "aeacus"
  spec.version       = Aeacus::VERSION
  spec.authors       = ["Tim Buchwaldt"]
  spec.email         = ["tim@buchwaldt.ws"]
  spec.description   = "Aeacus, judge of the dead, tells you why your ruby processes died"
  spec.summary       = "Aeacus takes stacktraceses from detached ruby processes"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
