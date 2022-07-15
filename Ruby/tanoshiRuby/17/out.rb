3.times do |i|
    $stdout.puts "#{Random.rand}"
    $stderr.puts "#{i+1}回出力しました"
end