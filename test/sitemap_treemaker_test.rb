require File.expand_path(File.dirname(__FILE__) + '/test_helper')
require File.expand_path(File.dirname(__FILE__) + '/../lib/sitemap_treemaker.rb')

class SitemapTreemaker < MiniTest::Unit::TestCase
  def test_initialize_returns_self
    sitemap_reader = SitemapTreemaker.new('http://iuhealth.org/sitemap.xml')
    assert sitemap_reader.is_a? SitemapTreemaker
  end

  def test_initialize_sets_xml
    sitemap_reader = SitemapTreemaker.new('http://iuhealth.org/sitemap.xml')
    assert sitemap_reader.xml != nil 
  end

  def test_tree_returns_a_tree_node_object
    sitemap_reader = SitemapTreemaker.new('http://iuhealth.org/sitemap.xml')
    assert sitemap_reader.tree.is_a? ::Tree::TreeNode
  end

  def test_tree_returns_the_root_tree_object
    sitemap_reader = SitemapTreemaker.new('http://iuhealth.org/sitemap.xml')
    assert sitemap_reader.tree.root == sitemap_reader.tree
  end
end
