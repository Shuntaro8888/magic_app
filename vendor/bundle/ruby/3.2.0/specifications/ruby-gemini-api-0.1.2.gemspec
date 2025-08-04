# -*- encoding: utf-8 -*-
# stub: ruby-gemini-api 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-gemini-api".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/rira100000000/ruby-gemini-api/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/rira100000000/ruby-gemini-api", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/rira100000000/ruby-gemini-api" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["rira100000000".freeze]
  s.date = "2025-07-10"
  s.description = "A simple Ruby wrapper for interacting with Google Gemini API".freeze
  s.email = ["101010hayakawa@gmail.com".freeze]
  s.homepage = "https://github.com/rira100000000/ruby-gemini-api".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Ruby client for Google's Gemini API".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<faraday>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<faraday-multipart>.freeze, ["~> 1.0"])
  s.add_runtime_dependency(%q<json>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.0"])
  s.add_development_dependency(%q<dotenv>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<vcr>.freeze, ["~> 6.3.1"])
end
