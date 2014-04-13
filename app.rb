require 'nokogiri'
require 'open-uri'
require 'sqlite3'
require 'active_support/all'
require 'date'

db = SQLite3::Database.new( "ffffound.db" )

def string_time_to_object(times)
  sum = 0
  times.each do |time|
    obj = time.split(' ')
    num = obj[0].to_i
    sum += num.send(obj[1])
  end
  sum
end

pages = 0..10

start_page = 'http://ffffound.com/?offset='

pages.each do |index|
  doc = Nokogiri::HTML(open(start_page+(index*25).to_s))
  doc.css('blockquote.asset').each do |block|
    string_date = block.css('.description')[0].text.match('(\s?(\d+)\s(hours|minutes|days))+\s(ago)')[0][0..-5]
    date =  (DateTime.now - string_time_to_object(string_date.scan(/(\d+\s\w+)/i).flatten).seconds).strftime("%Y-%m-%d %H:%M:%S")

    Date.parse()

    image_src = block.css("a img[@id*='asset']")[0]['src']
    db.execute("INSERT INTO images (image, created_at)
            VALUES (?, ?)", [image_src, date])
  end


  #p index.to_s + ' ------------------------------------------------------'
  sleep 1

end
