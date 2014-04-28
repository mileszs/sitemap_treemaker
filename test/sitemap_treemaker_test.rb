require 'test_helper'
require 'sitemap_treemaker'

class SitemapTreemakerTest < MiniTest::Unit::TestCase
  def setup
    fixtures_path = File.expand_path('../fixtures', __FILE__)
    sitemap_xml = File.read(File.join(fixtures_path, 'iuhealth.org/sitemap.xml'))
    FakeWeb.register_uri(:get, 'http://iuhealth.org/sitemap.xml', body: sitemap_xml)
    @sitemap_reader = SitemapTreemaker::Tree.new('http://iuhealth.org/sitemap.xml')
  end

  def test_initialize_returns_self
    assert @sitemap_reader.is_a? SitemapTreemaker::Tree
  end

  def test_initialize_sets_xml
    assert @sitemap_reader.xml
  end

  def test_tree_returns_a_tree_node_object
    assert @sitemap_reader.tree.is_a? ::Tree::TreeNode
  end

  def test_tree_returns_the_root_tree_object
    assert @sitemap_reader.tree.root == @sitemap_reader.tree
  end

  def test_tree_contains_about_page
    assert @sitemap_reader.tree.children.count > 0
    assert @sitemap_reader.tree['about-iu-health']
  end
end
