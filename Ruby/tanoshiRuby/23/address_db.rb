require "sqlite3"

SQLite3::Database.open("address.db") do |db|
    db.execute(<<-SQL)
        CREATE TABLE addresses
        (name TEXT, address TEXT)
    SQL
end

data = ["山田みのる", "東江戸川区東江戸川三丁目"]
SQLite3::Database.open("address.db") do |db|
    db.execute(<<-SQL, data)
        INSERT INTO addresses VALUES (?,?)
    SQL
end

SQLite3::Database.open("address.db") do |db|
    db.execute(<<-SQL) {|rows| p rows}
        SELECT name, address FROM addresses
    SQL
end