# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aliyun/version'

Gem::Specification.new do |spec|
  spec.name          = "aliyun"
  spec.version       = Aliyun::VERSION
  spec.authors       = ["fushang318"]
  spec.email         = ["fushang318@gmail.com"]
  spec.description   = %q{aliyun oss api}
  spec.summary       = %q{aliyun oss api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'mime-types', '~> 1.16'
end
