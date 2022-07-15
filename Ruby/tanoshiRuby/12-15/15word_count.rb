# 単語数のカウント
counts = Hash.new(0)

# 単語の集計
File.open(ARGV[0]) do |f|
    f.each_line do |line|
        words = line.split
        words.each do |word|
            counts[word] += 1
        end
    end
end

# 結果のソート
sorted = counts.sort_by {|c| c[1]}

# 結果の出力
sorted.each do |word, count|
    puts "#{word}; #{count}"
end