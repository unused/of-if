# frozen_string_literal: true

require_relative 'lib/of_if/version'

Gem::Specification.new do |spec|
  spec.name = 'of_if'
  spec.version = OfIf::VERSION
  spec.authors = ['Christoph Lipautz']
  spec.email = ['christoph@lipautz.org']

  spec.summary = 'Generate images of identation from Ruby source code'
  spec.description = <<~DESC
    Generate images of Ruby source code that focus on identation. Discuss on
    the style and find heavy blocks with ease.
  DESC
  spec.homepage = 'https://github.com/unused/of-if'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.  The
  # `git ls-files -z` loads the files in the RubyGem that have been added into
  # git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'bin'
  spec.executables << 'of-if'
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'chunky_png', '~> 1.4'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
