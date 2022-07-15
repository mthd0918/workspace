# 1) 曜日の日本語と英語の対応
wday = Hash.new
wday[:sunday] = "日曜日"
wday[:monday] = "月曜日"
wday[:tuesday] = "火曜日"
wday[:wednesday] = "水曜日"
wday[:thuurseday] = "木曜日"
wday[:friday] = "金曜日"
wday[:satureday] = "土曜日"

p wday[:sunday]
p wday[:thuurseday]
p wday[:friday]

# 2) wdayのペアの数
p wday.length

# 3)
wday.each {|a, b|p "「#{a}」は#{b}のことです"}

# 4)
def str2hash(str)
    hash = Hash.new()
    array = str.split(/\s+/)
    while key = array.shift
        value = array.shift
        hash[key] = value
    end
    return hash
end

p str2hash("bulue 青 white 白\nred 赤")