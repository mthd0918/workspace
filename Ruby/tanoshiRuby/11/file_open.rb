File.open("sample.txt") do |file|
    file.each_line do |line|
        print line
    end
ensure
    file.close
end