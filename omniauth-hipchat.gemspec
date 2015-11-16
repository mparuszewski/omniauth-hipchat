# coding: utf-8
require File.expand_path('../lib/omniauth-hipchat/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-hipchat"
  spec.version       = Omniauth::Hipchat::VERSION
  spec.authors       = ["Maciej Paruszewski"]
  spec.email         = ["maciek.paruszewski@gmail.com"]
  spec.description   = %q{OmniAuth strategy for HipChat}
  spec.summary       = %q{OmniAuth strategy for HipChat}
  spec.homepage      = "https://github.com/pinoss/omniauth-hipchat.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', "~> 1.3.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "mocha"
end
