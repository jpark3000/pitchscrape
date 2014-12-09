# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pitchscrape/version'

Gem::Specification.new do |spec|
  spec.name          = "pitchscrape"
  spec.version       = Pitchscrape::VERSION
  spec.authors       = ["Justin Park"]
  spec.email         = ["jpark3000@gmail.com"]
  spec.summary       = "Unofficial Pitchfork Media API"
  spec.description   = "For querying Pitchfork Best New Music albums"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.5"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
