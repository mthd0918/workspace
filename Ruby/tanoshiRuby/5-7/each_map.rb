# eachメソッド
array1 = [1, 2, 3]
array1.each do |item|
  p item * 2
end

array2 = [1, 2, 3]
result2 = []
array2.each do |item|
  result2 << item * 2
end
p result2

# mapメソッド
array3 = [1, 2, 3]
result3 = array3.map do |item|
  item * 2
end
p result3