# -*- encoding: utf-8 -*-
# stub: ruby-openai 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ruby-openai".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/alexrudall/ruby-openai/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/alexrudall/ruby-openai", "source_code_uri" => "https://github.com/alexrudall/ruby-openai" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-09-06"
  s.email = ["alexrudall@users.noreply.github.com".freeze]
  s.homepage = "https://github.com/alexrudall/ruby-openai".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A Ruby gem for the OpenAI GPT-3 API".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<dotenv>.freeze, ["~> 2.7.6"])
  s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.18.1"])
end
