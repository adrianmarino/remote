# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "remote/version"

Gem::Specification.new do |s|
  s.name        = "remote"
  s.version     = Remote::VERSION
  s.authors     = ["Adrian Norberto Marino"]
  s.email       = ["adrianmarino@gmail.com"]
  s.license     = "GLP-2"
  s.homepage    = "http://nonosoft.com.ar"
  s.summary     = "RMI API based to drb/Rinda"
  s.description =  <<-EOF
    Is a spesific API to use remote objects, useful to expose remote services easily.
  EOF
  s.rubyforge_project = "remote"
  s.files         = Dir['lib/**/*.rb']
  s.test_files    = Dir['lib/remote/test/*.rb']
  s.require_paths = ["lib"]
  s.add_development_dependency "test-unit"
  s.add_development_dependency "rspec"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "faker"
end
