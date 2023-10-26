# frozen_string_literal: true

require_relative "lib/inspectacular/version"

Gem::Specification.new do |spec|
  spec.name = "inspectacular"
  spec.version = Inspectacular::VERSION
  spec.authors = ["Joel Moss"]
  spec.email = ["joel@developwithstyle.com"]

  spec.summary = "Custom inspection for your Ruby objects."
  spec.homepage = "https://github.com/joelmoss/inspectacular"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joelmoss/inspectacular"
  spec.metadata["changelog_uri"] = "https://github.com/joelmoss/inspectacular/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ .git Gemfile])
    end
  end
  spec.require_paths = ["lib"]
end
