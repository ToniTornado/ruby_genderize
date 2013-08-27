# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_genderize/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_genderize"
  spec.version       = RubyGenderize::VERSION
  spec.authors       = ["Nicolai Constantin Reuschling"]
  spec.email         = ["nicolai+gemdev@reuschling.name"]
  spec.description   = %q{Rubygem to make use of Genderize.io API, which "guesses the gender of a first name"}
  spec.summary       = %q{Guesses the gender of a first name via use of Genderize.io API}
  spec.homepage      = "https://github.com/ncreuschling/ruby_genderize"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
