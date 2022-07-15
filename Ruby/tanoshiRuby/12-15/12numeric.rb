# 1)cels_to_fahrメソッドの定義
def cels_to_fahr(cels)

    # 華氏と摂氏の入れ物を用意
    # 数式を定義
    # 華氏を返す

    fahr = cels * 9 / 5 + 32
end

p cels_to_fahr(12)

# 2)fahr_to_cels(1)と逆)のメソッドの定義
#   摂氏1度 ～ 摂氏100度まで一度刻みで出力

def fahr2cels(fahr)

    # fahr_to_celsの定義
    # 摂氏1度、摂氏2度の定義
    # 繰り返しの定義

    # cels = fahr * 5 / 9 - 32 間違い
    cels = (fahr - 32) * 5 / 9
end



    # fahr を引数として渡す
    # 回数を指定し繰り返す

for i in 1..100
    f = fahr2cels(i).to_f
    puts "-----------------\n\t摂氏#{i}度\n\t華氏#{f}度"
end

# 1.upto(100) do |i|
#     print i, " ", fahr2cels(i), "\n"
# end

# 3)さいころを定義
# p Random.rand(6)
# def dice()
#     ary = []
#     1.upto(6) do |i|
#         ary << i
#     end
#     r = ary.sample
# end

def dice
    return Random.rand(6) + 1
end

dice()

# 4)10個のさいころの目の合計
def dice10()
    i = 0
    sum = 0
    while i < 10
        i += 1
        a = dice()
        # 振ったを足す
        sum = sum + a
    end
    p sum
end

dice10()

# 5)素数かどうかを確かめるprime?(num)を定義
# def prime?(num)

#     # numは1とその数以外では割ることができない
#     # num以下の数字を順に割っていく

#     # num未満の数値を用意
#     # num未満の数値から2までを用意する
#     nums = []
#     (num-1).downto(2) do |i|
#         nums << i
#     end
#     # リストの表示
#     p nums

#     # num と num未満の数値 ~ 2 までを割る
#     # リストをひとつづつ取り出し割る
#     # 余りを求める
#     x = nums[0 .. num]
#     p x
#     for x in nums[0 .. num]
#         if num % x == 0
#             p "素数ではありません"
#             break
#         end
#     end
# end
# prime?(17)
# # prime?(22989987)

def prime?(num)
    return false if num < 2
    2.upto(Math.sqrt(num)) do |i|
      if num % i == 0
        return false
      end
    end
    return true
  end
  
  1.upto(10) do |n|
    puts n if prime?(n)
  end