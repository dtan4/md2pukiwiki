# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'md2pukiwiki/version'

Gem::Specification.new do |spec|
  spec.name          = "md2pukiwiki"
  spec.version       = Md2pukiwiki::VERSION
  spec.authors       = ["dtan4"]
  spec.email         = ["dtanshi45@gmail.com"]
  spec.summary       = %q{Convert Markdown to Pukiwiki-notation}
  spec.description   = %q{Text converter from Markdown to Pukiwiki-notation}
  spec.homepage      = "https://github.com/dtan4/md2pukiwiki"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "coveralls"
end
