#-*- encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'railgen/version'

Gem::Specification.new do |spec|
  spec.name          = "railgen"
  spec.version       = Railgen::VERSION
  spec.authors       = ["Naoto SHINGAKI"]
  spec.email         = ["n.shingaki@gmail.com"]
  spec.description   = %q{Railgen is generate gem that provides a rails application}
  spec.summary       = %q{Railgen is generate gem that provides a rails application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
