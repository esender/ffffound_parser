require 'sqlite3'

db = SQLite3::Database.new( "ffffound.db" )

rows = db.execute <<-SQL
  create table images (
    id integer primary key,
    image varchar(255),
    posted boolean default false,
    created_at datetime
  );
SQL
