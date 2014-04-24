# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'berkshelf/envs/version'

Gem::Specification.new do |spec|
  spec.name          = "berkshelf-envs"
  spec.version       = Berkshelf::Envs::VERSION
  spec.authors       = ["Denis Barishev"]
  spec.email         = ["denz@twiket.com"]
  spec.summary       = %q{Berkshelf envs extension}
  spec.description   = %q{Handy extension for multi-environment usage}
  spec.homepage      = "https://github.com/dennybaa/berkshelf-envs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'berkshelf', '>= 3.0.0'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
