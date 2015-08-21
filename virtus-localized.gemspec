# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtus/localized/version'

Gem::Specification.new do |spec|
  spec.name          = "virtus-localized"
  spec.version       = Virtus::Localized::VERSION
  spec.authors       = ["xescuGC"]
  spec.email         = ["xescugil@gmail.com"]

  spec.summary       = spec.description
  spec.description   = "Extension from Virtus to add Localized feature"
  spec.homepage      = "https://github.com/XescuGC/virtus-localized"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('virtus')
  spec.add_dependency('i18n')

  #spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake"
end
