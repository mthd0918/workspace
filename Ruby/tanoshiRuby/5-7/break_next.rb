puts "breakの例："
i = 0
["Perl", "Python", "Ruby", "Scheme"].each do |lang|
    i += 1
    if i == 3
        break
    end
    p [i, lang]
end
puts "--------------------------------"
puts "nextの例："
i = 0
["Perl", "Python", "Ruby", "Scheme"].each do |lang|
    i += 1
    if i == 3
        next
    end
    p [i, lang]
end

array1 = [1, 2, 3]
array1.each do |item|
  p item * 2
end

p array1

array2 = [1, 2, 3]
result2 = []
array2.each do |item|
  result2 << item * 2
end

