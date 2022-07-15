pattern = Regexp.new(ARGV[0].encode("UTF-8"))
filename = ARGV[1]

count = 0
File.read(filename, encoding: "UTF-8").scan(pattern) do |s|
    count += 1
end
puts "count: #{count}"