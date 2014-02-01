require 'nokogiri'
require 'open-uri'
require 'sqlite3'

db = SQLite3::Database.new( "ffffound.db" )

# rows = db.execute <<-SQL
#   create table images (
#     id integer primary key,
#     image varchar(255),
#     posted boolean default false
#   );
# SQL

db.execute("INSERT INTO images (image) 
            VALUES (?)", ['http://blablabal.ru'])
# pages = 0..100

# start_page = 'http://ffffound.com/?offset='

# pages.each do |index|
#   doc = Nokogiri::HTML(open(start_page+(index*25).to_s))

#   images = []

#   doc.css("a img[@id*='asset']").each do |link|
#     images << link['src']
#   end

#   puts images
#   puts images.count
#   p '------------------------------------------------------'
#   sleep 1
# end

