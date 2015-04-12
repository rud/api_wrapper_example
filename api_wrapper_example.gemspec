# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'api_wrapper_example/version'

Gem::Specification.new do |spec|
  spec.name          = 'api_wrapper_example'
  spec.version       = ApiWrapperExample::VERSION
  spec.authors       = ['Laust Rud Jacobsen']
  spec.email         = ['laust@object.io']

  spec.summary       = 'An API wrapper example project with builtin mocking'
  spec.description   = <<-DESC
    Wrapping an API in a convenient gem requires making quite a few
    design decisions. This is one handy way of structuring and
    testing everything, in addition to making a tested mock-version
    of the API available.
  DESC
  spec.homepage      = 'https://github.com/rud/api_wrapper_example'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'minitest'
end
