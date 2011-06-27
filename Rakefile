require "rubygems"
require 'rake'
require 'rake/testtask'
require "bundler/setup"
require './lib/sitemap_treemaker/version'

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/*_test.rb'
  test.verbose = true
end

task :default => :test

task :build do
  system "gem build sitemap_treemaker.gemspec"
end
 
task :release => :build do
  system "gem push sitemap_treemaker-#{SitemapTreemaker::VERSION}"
end

