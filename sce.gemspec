# frozen_string_literal: true

require_relative 'lib/Sound_Count_Engine/version'

Gem::Specifycation.new do |spec|
	spec.name          = 'Sound_Count_Engine'
	spec.version       = Sound_Count_Engine::VERSION
	spec.authors       = ['urabexon']
	spec.email         = ['hiroki708.a48uk@gmail.com']

	spec.summary       = 'Sound_Count_Engine is a helper that counts the number of sounds in Japanese sentences.'
	spec.description   = 'Sound_Count_Engine is a helper that counts the number of sounds in Japanese sentences.'
	spec.homepage      = 'https://github.com/urabexon/Sound_Count_Engine'
	spec.license       = 'MIT'
	spec.required_ruby_version = '>= 2.7.0'

	spec.metadata['homepage_uri'] = spec.homepage
  	spec.metadata['source_code_uri'] = 'https://github.com/urabexon/Sound_Count_Engine'

	# Specify which files should be added to the gem when it is released.
  	# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  	spec.files = Dir.chdir(File.expand_path(__dir__)) do
    	`git ls-files -z`.split("\x0").reject do |f|
    		(f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    	end
  	end
	spec.bindir        = 'exe'
	spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
	spec.require_paths = ['lib']

	spec.add_dependency 'mecab', '~> 0.996'
	spec.add_dependency 'natto', '~> 1.2.0'

	spec.add_development_dependency 'dotenv'
	spec.add_development_dependency 'rake', '~> 13.0'
	spec.add_development_dependency 'rspec', '~> 3.0'
	spec.add_development_dependency 'rubocop', '~> 1.7'
end