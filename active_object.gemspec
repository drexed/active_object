# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_object/version'

Gem::Specification.new do |spec|
  spec.name          = "active_object"
  spec.version       = ActiveObject::VERSION
  spec.authors       = ["Juan Gomez"]
  spec.email         = ["j.gomez@drexed.com"]

  spec.summary       = %q{Gem for commonly used ruby object helpers.}
  spec.description   = %q{Class extensions of commonly used ruby object helpers.}
  spec.homepage      = "https://github.com/drexed/active_object"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.4.0"
end