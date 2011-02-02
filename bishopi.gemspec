# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bishopi/version"

Gem::Specification.new do |s|
  s.name        = "bishopi"
  s.version     = Bishopi::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bob Nadler, Jr."]
  s.email       = ["bnadlerjr@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/bishopi"
  s.summary     = %q{A Ruby based web crawler.}
  s.description = %q{Bishopi is a Ruby based web crawler intended as an experiment in learning how web crawlers work.}

  s.rubyforge_project = "bishopi"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
