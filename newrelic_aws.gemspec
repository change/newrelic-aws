# -*- encoding: utf-8 -*-
require File.expand_path('../lib/newrelic_aws/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors     = ["Kyle VanderBeek"]
  gem.email       = ["kyle@change.org"]
  gem.description = %q{New Relic Instrumentation for the official AWS SDK}
  gem.summary     = %q{New Relic Instrumentation for the official AWS SDK}
  gem.homepage    = "http://github.com/change/newrelic_aws"
  gem.license     = "MIT"

  gem.files         = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  gem.name          = "newrelic_aws"
  gem.require_paths = ["lib"]
  gem.version       = NewrelicAWS::VERSION

  gem.add_dependency 'newrelic_rpm', '>= 3.5.0'

  gem.add_development_dependency 'rake'
end