module SitemapTreemaker
  class Sitemap
    attr_accessor :sitemap_url, :xmls, :urls

    def initialize(sitemap_url)
      @sitemap_url = sitemap_url
      @xmls = { sitemap_url => Net::HTTP.get_response(URI.parse(self.sitemap_url)).body }
    end

    def tree
      return @tree unless @tree.nil?
      @tree = ::Tree::TreeNode.new('root', sitemap_url)
      @xmls.values.each do |xml|
        nokogiri = Nokogiri::XML(xml)
        parse_sitemaps nokogiri
        parse nokogiri
      end
      @tree
    end

    def print_tree_diagram
      @tree.print_tree
    end

    private

    def parse(xml)
      urls = xml.css('url loc').map { |node| node.text }
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
    end

    def parse_sitemaps(xml)
      sitemaps = xml.css('sitemap loc').map { |node| node.text }
      sitemaps.each do |sitemap_url|
        next if @xmls.key?(sitemap_url)
        xml = Net::HTTP.get_response(URI.parse(sitemap_url)).body
        @xmls[sitemap_url] = xml
        parse Nokogiri::XML(xml)
      end
    end
  end
end
