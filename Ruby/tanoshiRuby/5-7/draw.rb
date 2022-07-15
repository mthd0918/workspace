5.times do
    puts "|"
end

num = 0
i = 0
while num < 5
    num += i
    i += 1
end
puts num

num.times do
    puts "・"
end