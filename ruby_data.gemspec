# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name        = 'yaks'
  gem.version     = '0.0.0'
  gem.authors     = [ 'Arne Brasseur' ]
  gem.email       = [ 'arne@arnebrasseur.net' ]
  gem.description = 'Shared tests and benchmarks for Ruby data structures'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/plexus/rubydataspec'
  gem.license     = 'MIT'

  gem.require_paths    = %w[lib]
  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files -- spec`.split($/)
  gem.extra_rdoc_files = %w[README.md]

  gem.add_development_dependency 'rspec', '~> 2.14'
  # gem.add_development_dependency 'rake'
  gem.add_development_dependency 'benchmark-ips'
end
