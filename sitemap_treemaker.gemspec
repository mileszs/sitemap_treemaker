lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'sitemap_treemaker/version'

Gem::Specification.new do |s|
  s.name        = "sitemap_treemaker"
  s.version     = SitemapTreemaker::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Miles Z. Sterrett"]
  s.email       = ["miles@mileszs.com"]
  s.homepage    = "http://github.com/mileszs/sitemap_treemaker"
  s.summary     = "Grow a tree from a sitemap. It's eco-friendly despite the XML garbage!"
  s.description = "So, you've got a sitemap.xml, and you want a hierarchal representation of the URLs within, right? Well, here's your huckleberry."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rake"
  s.add_development_dependency "rocco"
  s.add_development_dependency "rr"
  s.add_development_dependency "turn"
  s.add_development_dependency "fakeweb"

  s.add_dependency "nokogiri"
  s.add_dependency "rubytree"

  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
end
