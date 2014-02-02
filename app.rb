require 'nokogiri'
require 'open-uri'
require 'sqlite3'

db = SQLite3::Database.new( "ffffound.db" )

<<<<<<< HEAD
pages = 0..100
=======
pages = 0..4
>>>>>>> 69b5ced95a378b70fa33b7a2554a3e08753bf7b5

start_page = 'http://ffffound.com/?offset='

pages.each do |index|
  doc = Nokogiri::HTML(open(start_page+(index*25).to_s))

  doc.css("a img[@id*='asset']").each do |link|
    db.execute("INSERT INTO images (image) 
            VALUES (?)", [link['src']])
  end

  p index.to_s + ' ------------------------------------------------------'
  sleep 1

end
