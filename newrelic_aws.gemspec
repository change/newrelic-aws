# -*- encoding: utf-8 -*-
require File.expand_path('../lib/newrelic-aws/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ["Kyle VanderBeek"]
  gem.email       = ["kyle@change.org"]
  gem.description = %q{Unofficial New Relic Instrumentation for the official AWS SDK}
  gem.summary     = %q{Unofficial New Relic Instrumentation for the official AWS SDK}
  gem.homepage    = "http://github.com/change/newrelic-aws"
  gem.license     = "MIT"

  gem.files         = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  gem.name          = "newrelic-aws"
  gem.require_paths = ["lib"]
  gem.version       = NewrelicAWS::VERSION

  gem.add_dependency 'newrelic_rpm', '>= 3.5.0'
end
