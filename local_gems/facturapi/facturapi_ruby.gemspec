# -*- encoding: utf-8 -*-
# stub: facturapi_ruby 1.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "facturapi_ruby".freeze
  s.version = "1.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Diego Llamas Velasco".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-11-22"
  s.description = "Http client for https://facturapi.io".freeze
  s.email = ["diegollams@gmail.com".freeze]
  s.files = [".gitignore".freeze, ".rspec".freeze, ".travis.yml".freeze, "CODE_OF_CONDUCT.md".freeze, "Gemfile".freeze, "Gemfile.lock".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "bin/console".freeze, "bin/setup".freeze, "facturapi_ruby.gemspec".freeze, "lib/facturapi_ruby.rb".freeze, "lib/facturapi_ruby/configuration.rb".freeze, "lib/facturapi_ruby/constants.rb".freeze, "lib/facturapi_ruby/customers.rb".freeze, "lib/facturapi_ruby/files.rb".freeze, "lib/facturapi_ruby/http_client.rb".freeze, "lib/facturapi_ruby/invoices.rb".freeze, "lib/facturapi_ruby/version.rb".freeze]
  s.homepage = "https://github.com/diegollams/facturapi_ruby".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Crea Facturas Electr\u00F3nicas v\u00E1lidas lo m\u00E1s f\u00E1cil posible (CFDI) https://facturapi.io".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.16"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
  end
end
