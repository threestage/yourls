# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'yourls'
  s.version = File.read(File.dirname(__FILE__) + '/VERSION').strip
  s.authors = ['Justin Rhinesmith']
  s.email = 'jrhinesmith@threestage.com'
  s.summary = 'Use the Yourls API to shorten or expand URLs'
  s.description = 'Use the Yourls API to shorten or expand URLs'
  
  s.files = ["yourls.gemspec", "lib/yourls.rb", "lib/yourls/yourls.rb", "lib/yourls/client.rb", "lib/yourls/url.rb", "README"]
  s.require_paths = ["lib"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<crack>, [">= 0.1.8"])
      s.add_runtime_dependency(%q<httparty>, [">= 0.6.1"])
    else
      s.add_dependency(%q<crack>, [">= 0.1.8"])
      s.add_dependency(%q<httparty>, [">= 0.6.1"])
    end
  else
    s.add_dependency(%q<crack>, [">= 0.1.8"])
    s.add_dependency(%q<httparty>, [">= 0.6.1"])
  end
end
