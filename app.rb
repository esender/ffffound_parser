require 'nokogiri'
require 'open-uri'

pages = 1..100

start_page = 'http://ffffound.com/'

doc = Nokogiri::HTML(open(start_page))

doc.css("a img[@id*='asset']").each do |link|
  puts link['src']
end