Gem::Specification.new do |s|
  s.name        = 'cars'
  s.version     = '0.0.1'
  s.date        = '2017-04-07'
  s.summary     = 'A simple 2D cars game with gosu'
  s.description = 'A 2D cars game with gosu'
  s.authors     = ['Giovanni Alberto García']
  s.email       = 'delirable@gmail.com'
  s.files       = ['lib/cars.rb']
  s.executables = ['cars']
  s.homepage    = 'http://rubygems.org/gems/cars'
  s.license     = 'MIT'
  s.add_runtime_dependency 'gosu', ['=0.11.3.1']
end