pattern = Regexp.new(ARGV[0].encode("UTF-8"))
filename = ARGV[1]

File.open(filename, "r:UTF-8") do |file|
    file.each_line do |line|
        if pattern =~ line
            print line
        end
    end
end