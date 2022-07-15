require "csv"

code = ARGV[0]
# 処理速度の計測
start_time = Time.now
CSV.open("KEN_ALL.CSV", "r:Shift_JIS:UTF-8") do |csv|
    csv.each do |record|
        # 入力した値と一致した値を表示
        puts record.join(" ") if record[2] == code
    end
end
# 処理速度の計測
p Time.now - start_time