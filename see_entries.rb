require 'sqlite3'

db = SQLite3::Database.new( "ffffound.db" )

db.execute( "select * from images limit 25" ) do |row|
  p row
end
