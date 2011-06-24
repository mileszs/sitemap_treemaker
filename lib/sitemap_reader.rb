require 'net/http'
require 'uri'

class SitemapReader
  attr_accessor :url, :xml
  def initialize(sitemap_url)
    url= URI.parse(sitemap_url)
    xml = Net::HTTP.get_response(url).body
  end
end
