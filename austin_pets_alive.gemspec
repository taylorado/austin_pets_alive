
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'austin_pets_alive/version'

Gem::Specification.new do |spec|
  spec.name          = 'austin_pets_alive'
  spec.version       = AustinPetsAlive::VERSION
  spec.authors       = ['Taylor Donlan']
  spec.email         = ['donlan@gmail.com']

  spec.summary       = 'Browse dogs available to for adoption from Austin Pets Alive'
  spec.description   = 'Pulls publicly available dog listings from AustinPetsAlive.org into a CLI'
  spec.homepage      = 'https://github.com/taylorado/austin_pets_alive'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_dependency 'nokogiri'
end
