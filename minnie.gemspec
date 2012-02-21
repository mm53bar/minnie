# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "minnie/version"

Gem::Specification.new do |s|
  s.name        = "minnie"
  s.version     = Minnie::VERSION
  s.authors     = ["Michael McClenaghan"]
  s.email       = ["mike@sideline.ca"]
  s.homepage    = "https://github.com/mm53bar/minnie"
  s.summary     = %q{Simplest authentication possible}
  s.description = %q{The simplest that authentication can get while still being useful}

  s.rubyforge_project = "minnie"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("bcrypt-ruby", "~> 3.0")
  s.add_dependency("railties", "~> 3.0")
end
