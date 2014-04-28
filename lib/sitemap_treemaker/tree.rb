module SitemapTreemaker
  class Tree
    attr_accessor :sitemap_url, :xml, :urls

    def initialize(sitemap_url)
      self.sitemap_url = sitemap_url
      self.xml = Net::HTTP.get_response(URI.parse(self.sitemap_url)).body
      self
    end

    def tree
      return @tree unless @tree.nil?
      nokogiri = Nokogiri::XML(xml)
      urls = nokogiri.css('url loc').map { |node| node.text }
      @tree = ::Tree::TreeNode.new('root', sitemap_url)
      urls.each do |url|
        parts = URI.parse(url.gsub(/\s\//, '/')).path.split('/').select { |p| p.strip != '' }
        branch = tree
        parts.each do |part|
          if branch[part].nil?
            branch = branch.add(::Tree::TreeNode.new(part, part))
          else
            branch = branch[part]
          end
        end
      end
      @tree
    end

    def print_tree_diagram
      @tree.print_tree
    end
  end
end
