require_relative "lib/testing_agent/version"

Gem::Specification.new do |spec|
  spec.name        = 'testing_agent'
  spec.version     = TestingAgent::VERSION
  spec.authors     = ['Scott Werner']
  spec.email       = ['scott@sublayer.com']
  spec.homepage    = 'https://www.sublayer.com'
  spec.summary     = 'An agent that monitors a test file and an implementation file and makes sure the implementation file always passes the tests'
  spec.description = 'Pair with an LLM by writing tests, leting them fail, and having an LLM write the code to pass the tests.'
  spec.license     = 'MIT'

  spec.files       = `git ls-files`.split("\n")
  spec.bindir      = 'exe'
  spec.executables << 'testing_agent'
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3'

  spec.add_dependency 'cli-kit', '~> 5'
  spec.add_dependency 'cli-ui', '~> 2.2.3'
  spec.add_dependency 'sublayer', '~> 0.1'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
