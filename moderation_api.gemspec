# frozen_string_literal: true

require_relative "lib/moderation_api/version"

Gem::Specification.new do |s|
  s.name = "moderation-api"
  s.version = ModerationAPI::VERSION
  s.summary = "Ruby library to access the Moderation API API"
  s.authors = ["Moderation API"]
  s.email = "support@moderationapi.com"
  s.homepage = "https://gemdocs.org/gems/moderation-api"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/moderation-api/sdk-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "connection_pool"
end
