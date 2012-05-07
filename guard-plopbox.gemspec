# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "guard-plopbox"
  s.version     = 0.1 
  s.authors     = ["Benoit Garret"]
  s.email       = ["benoit dot garret at gadz dot org"]
  s.homepage    = "http://github.com/bgarret/guard-plopbox"
  s.summary     = %q{A simple guard library for syncing local and remote directories via FTP}
  s.description = %q{A simple guard library for syncing local and remote directories via FTP}

  s.rubyforge_project = "guard-plopbox"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
