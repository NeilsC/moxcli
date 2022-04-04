# frozen_string_literal: true

require_relative "lib/moxcli/version"

Gem::Specification.new do |spec|
  spec.name = "moxcli"
  spec.version = Moxcli::VERSION
  spec.authors = ["Neils Christoffersen"]
  spec.email = ["me@neils.tech"]

  spec.summary = "A powerful and intuitive CLI for the MTG deckbuilding site, Moxfield"
  spec.homepage = "https://github.com/NeilsC/moxcli"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/NeilsC/moxcli"
  spec.metadata["changelog_uri"] = "https://github.com/NeilsC/moxcli/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.2"
end
