# 郵便データ検索をして、処理する秒数とともに表示しています

# ライブラリの呼び出し
require_relative "jzipcode"

# 処理速度の計測
start_time = Time.now

# 検索のために必要なファイルを用意しています
db = File.join(__dir__, "jzipcode.db")
csv = File.join(__dir__, "KEN_ALL.CSV")
jzipcode = JZipCode.new(db) #----------------------------[クラスとメソッド4]
jzipcode.create(csv) #----------------------------[クラスとメソッド2]


# 結果の表示
keyword = ARGV[0]
result = jzipcode.find_by_code(keyword)
if result.empty?
    result = jzipcode.find_by_address(keyword)
end
puts result
puts
# 処理速度の計測
puts "#{Time.now - start_time}秒"