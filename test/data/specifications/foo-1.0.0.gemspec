# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{foo}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Hinegardner"]
  s.date = %q{2010-06-23}
  s.description = %q{foo gem}
  s.email = %q{jeremy@hinegardner.org}
  s.files = ["README.rdoc", "lib/foo.rb", "bin/foo", "Rakefile", "foo.gemspec"]
  s.homepage = %q{http://github.com/copiousfreetime/stickler}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{foo gem}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end

