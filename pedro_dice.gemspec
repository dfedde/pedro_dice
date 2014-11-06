
# add lib to the front of the load path
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'pedro_dice/version'

Gem::Specification.new do |spec|
  spec.name          = "pedro_dice"
  spec.version       = PedroDice::VERSION
  spec.authors       = ["Duncan Fedde"]
  spec.email         = ["Duncan@Fedde.us"]
  spec.description   = %q{a chat bot that runs the game pedro dice in irc}
  spec.summary       = %q{a chat bot pedro dice dm}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'cinch'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
