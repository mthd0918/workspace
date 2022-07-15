pattern = Regexp.new(ARGV[0].encode("UTF-8"))
filename = ARGV[1]

count = 0
File.open(filename, "r:UTF-8") do |file|
    file.each_line do |line|
        if pattern =~ line
            line.scan(pattern) do |s|
                count += 1
            end
            print line
        end
    end
end

puts "count: #{count}"
