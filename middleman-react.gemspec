# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-react/version"

Gem::Specification.new do |s|
  s.name = "middleman-react"
  s.version = Middleman::React::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Thomas Reynolds"]
  s.email = ["me@tdreyno.com"]
  s.homepage = "https://github.com/tdreyno/middleman-react"
  s.summary = %q{A React.js extension for Middleman}
  s.description = %q{A React.js extension for Middleman}
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  s.add_runtime_dependency("middleman-core", [">= 3.2"])
end