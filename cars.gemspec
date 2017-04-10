Gem::Specification.new do |s|
  s.name        = 'cars'
  s.version     = '0.0.4'
  s.date        = '2017-04-07'
  s.summary     = 'A simple 2D cars game with gosu'
  s.description = 'A 2D cars game with gosu'
  s.authors     = ['Giovanni Alberto García']
  s.email       = 'delirable@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.homepage    = 'http://rubygems.org/gems/cars'
  s.license     = 'MIT'
  s.add_runtime_dependency 'gosu', '~> 0.11', '0.11.3.1'
  s.add_development_dependency 'pry', '~> 0.10', '>= 0.10.4'
  s.required_ruby_version = '>= 1.8.6'
end