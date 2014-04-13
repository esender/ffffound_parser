require 'nokogiri'
require 'open-uri'

class Parser
  def initialize(url)
    @url = url
  end

  def parse
    Nokogiri::HTML(open(@url)).css("blockquote[@id*='assetid']").map do |elem|
      {
        date: /^.*<br>(.*)<a.*$/.match(elem.css('.description')[0].inner_html)[1],
        images: elem.css("img[@id*='asset']")[0]['src'],
        text: ''
      }
    end
  end
end