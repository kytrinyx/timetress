# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timetress/version'

Gem::Specification.new do |gem|
  gem.name          = "timetress"
  gem.version       = Timetress::VERSION
  gem.authors       = ["Katrina Owen"]
  gem.email         = ["katrina.owen@gmail.com"]
  gem.description   = %q{Answers the age-old question 'When is mothersday this year?'}
  gem.summary       = %q{Knows about holidays and workdays}
  gem.homepage      = "https://github.com/kytrinyx/timetress"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest', '~> 4.0'
end
