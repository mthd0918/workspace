require "sqlite3"
require "csv"

class JZipCode 
    CSV_COLUMN = {code: 2, pref: 6, city: 7, addr: 8}

    def initialize(dbfile) # initializeメソッド
        @dbfile = dbfile # インスタンス変数
    end

    # 郵便番号データが入ったデータベースを作成しています
    def create(zipfile) 
        return if File.exist?(@dbfile)
        SQLite3::Database.open(@dbfile) do |db|
            db.execute(<<-SQL)
            CREATE TABLE IF NOT EXISTS zip_codes
            (code TEXT, pref TEXT, city TEXT, addr TEXT, alladdr TEXT)
        SQL
        db.execute("BEGIN TRANSACTION")
        CSV.open(zipfile, "r:Shift_JIS:UTF-8") do |csv|
                data = Hash.new
                # キーと値を指定してハッシュを作成
                CSV_COLUMN.each {|key, index| data[key] = rec[index]}
                data[:alladdr] = data[:pref] + data[:city] + data[:addr]
                db.execute(<<-SQL, data)
                    INSERT INTO zip_codes VALUES
                    (:code, :pref, :city, :addr, :alladdr)
                    SQL
                end
            end
        db.execute("COMMIT TRANSACTION")
        end
        return true 
    end

    # 郵便番号から郵便データを検索しています
    def find_by_code(code)
        ret = []
        SQLite3::Database.open(@dbfile) do |db|
            db.execute(<<-SQL, code) {|row| ret << row.join(" ")}
                SELECT code, alladdr
                    FROM zip_codes
                WHERE code = ?
            SQL
        end
        return ret.map {|line| line + "\n"}.join
    end

    # 住所から郵便データを検索しています
    def find_by_address(addr)
        ret = []
        SQLite3::Database.open(@dbfile) do |db|
            # 部分一致検索
            like = "%#{addr}%"
            db.execute(<<-SQL, like) {|row| ret << row.join(" ")}
                SELECT code, alladdr
                    FROM zip_codes
                WHERE alladdr LIKE ?
            SQL
        end
        return ret.map {|line| line + "\n"}.join #----------------------------[繰り返し]
    end
end


i = 0
["Perl", "Python", "Ruby", "Scheme"].each do |lang|
    i += 1
    if i == 3
        next
    end
    p [i, lang]
end