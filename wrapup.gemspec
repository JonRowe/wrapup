# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wrapup/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jon Rowe"]
  gem.email         = ["hello@jonrowe.co.uk"]
  gem.description   = %q{WrapUp, a simple wrapper gem for collections}
  gem.summary       = %q{WrapUp, a simple wrapper gem for collections}
  gem.homepage      = "https://github.com/JonRowe/wrapup"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec|features)/})
  gem.name          = "wrapup"
  gem.require_paths = ["lib"]
  gem.version       = WrapUp::VERSION

  if RUBY_VERSION.to_f < 2
    s.add_development_dependency "rake", '~> 10.0'
  elsif
    s.add_development_dependency "rake", '~> 12.3.3'
  end
  gem.add_development_dependency 'rspec'
end
