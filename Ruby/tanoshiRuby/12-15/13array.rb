# 1) 1 ~ 100 までの整数を用意
# ary = []
# 1.upto(100) do |i|
#     ary << i
# end
# p ary

# 回答)
# 空の配列を作って、1から100までの値を格納する
# a = []
# 100.times{|i| a[i] = i + 1 }

# 範囲オブジェクト(p.176)のto_aメソッドを使う
a = (1..100).to_a

# 2) 1)の配列を100倍した配列a2の作成、新しい配列を作成せずに100倍

# a2 = []
# ary.each do |i|
#     a2 << i * 100
# end
# p a2

# ary[0..99] = a2[0..99]
# p ary

# 回答)
# 配列を作成する
a = (1..100).to_a

# 配列の全ての要素を100倍した値を含む新しい配列を作る
# a2 = a.collect{|i| i * 100 }
# p a2

# # 配列の全ての要素を100倍する
# a.collect!{|i| i * 100 }
# p a

# 3) 1)の配列から3の倍数だけを取り出した配列の作成、新しい配列を作らずに3の倍数を削除
# a3= []
# ary.each do |i|
#     if  i % 3 != 0
#         ary.pop
#     else
#         a3 << i
# end
# p a3

# 回答) 
# aryから3の倍数だけを取り出す
# a3 = a.reject{|i| i % 3 != 0 }
# p a3

# # なお、条件に当てはまるものだけ返す、!が不要なselectというメソッドもあります
# a4 = a.select{|i| i % 3 == 0 }
# p a4

# # aryから3の倍数以外の数を削除する
# a.reject!{|i| i % 3 != 0 }
# p a

# 4) 1)の配列を逆順へ
a.reverse!
p a

# 回答)
# # 配列を作成する
# a = (1..100).to_a

# # (a) Array#reverseを使う
# a2 = a.reverse
# p a2

# # (b) Array#sortを使う
# a2 = a.sort{|n1, n2| n2 <=> n1 }
# p a2

# # (c) Array#sort_byを使う
# a2 = a.sort_by{|i| -i }
# p a2

# 5) 1)に含まれる整数の和
# (a) Array#eachで和を求める
result = 0
a.each{|i| result += i }
p result

# (b) Array#injectで和を求める
p a.inject(0){|memo, i| memo += i }

# 6) ary = 1~ 100 10個の要素を含む配列を取り出す
# 1.upto(100)
# p ary
ary = (1..100).to_a
result = Array.new
10.times do |i|
    result << ary[i*10,10]
end
p result

# 7) 
def sum_array(ary1, ary2)
    result = Array.new
    i = 0
    ary1.each do |elem1|
      result << elem1 + ary2[i]
      i+=1
    end
    return result
  end
  
#   # Array#zipを使った別解
#   def sum_array_zip(ary1, ary2)
#     result = Array.new
#     ary1.zip(ary2){|a, b| result << a + b }
#     return result
#   end
  
#   p sum_array([1, 2, 3], [4, 6, 8])