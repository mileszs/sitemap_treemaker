class SitemapTreemakerWithNestedSitemapsTest < MiniTest::Unit::TestCase
  def setup
    fixtures_path = File.expand_path('../fixtures', __FILE__)
    FakeWeb.register_uri(:get, 'http://artsy.net/sitemap.xml', body: File.read(File.join(fixtures_path, 'artsy.net/sitemap.xml')))
    FakeWeb.register_uri(:get, 'http://artsy.net/artists-1.xml', body: File.read(File.join(fixtures_path, 'artsy.net/sitemap-artists-1.xml')))
    FakeWeb.register_uri(:get, 'http://artsy.net/artworks-33.xml', body: File.read(File.join(fixtures_path, 'artsy.net/sitemap-artworks-33.xml')))
    @sitemap_reader = SitemapTreemaker::Sitemap.new('http://artsy.net/sitemap.xml')
  end

  def test_tree_contains_node_at_root
    assert @sitemap_reader.tree.children.count > 0
    assert @sitemap_reader.tree['about']
  end

  def test_tree_contains_nested_nodes
    assert @sitemap_reader.tree.children.count > 0
    assert @sitemap_reader.tree['about']
    assert @sitemap_reader.tree['artist']['kim-andre-hagen']
    assert @sitemap_reader.tree['artwork']['sigmar-polke-danneckers-housegecko-1-4-4']
  end

  def test_tree_keeps_track_of_xmls
    assert @sitemap_reader.tree
    assert @sitemap_reader.xmls.count == 3
  end
end
