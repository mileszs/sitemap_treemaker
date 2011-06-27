# Sitemap Treemaker
... 'cause all the clever names are taken, probably.

**Problem**: I've got a basic sitemap.xml. It looks like this:

```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
      http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">

      <url><loc>http://someplace.org/</loc><changefreq>always</changefreq><priority>0.5</priority></url>
      <url><loc>http://someplace.org/about-someplace/</loc><changefreq>always</changefreq><priority>0.5</priority></url>
      <url><loc>http://someplace.org/about-someplace/board-of-directors/</loc><changefreq>always</changefreq><priority>0.5</priority></url>
    </urlset>
```

I need to build a tree out of all of these clearly hierarchal links. So, I do this:

```ruby

    sitemap_tree = SitemapTreemaker.new('http://someplace.org/sitemap.xml')
    sitemap_tree.tree
```

`tree` returns a `Tree::TreeNode` from the library [RubyTree](http://rubytree.rubyforge.org/). I can now take that tree and do something useful with it, maybe. Or, I could just print a pretty diagram:

```ruby
    sitemap_tree = SitemapTreemaker.new('http://someplace.org/sitemap.xml')
    sitemap_tree.print_tree_diagram

    #=>
    * root
    |---+ about-someplace
    |    |---> board-of-directors
