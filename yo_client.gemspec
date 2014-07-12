# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yo_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'yo_client'
  spec.version       = YoClient::VERSION
  spec.authors       = ['Yu Nakanishi']
  spec.email         = ['you@nakanishi.email']
  spec.summary       = 'Yo (http://www.justyo.co/) Ruby Client'
  spec.description   = 'Yo (http://www.justyo.co/) Ruby Client'
  spec.homepage      = 'https://github.com/youcune/yo_client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'pry-byebug'
  spec.add_dependency 'faraday', '~> 0.9.0'
  spec.add_dependency 'faraday_middleware', '~> 0.9.0'
  spec.required_ruby_version = '>= 1.9'
end
