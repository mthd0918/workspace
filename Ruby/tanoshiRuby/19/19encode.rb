# 1)
def to_utf8(str_eur, str_sjis)
    str_eur.encode("UTF-8") + str_sjis.encode("UTF-8")
end

str_eur = "こんにちは".encode("EUC-JP")
str_sjis = "さようなら".encode("Shift_JIS")

puts to_utf8(str_eur, str_sjis)

# 2)
File.open("sjis.txt", "w:Shift_JIS") do |f|
    f.write("こんにちは")
end

File.open("sjis.txt", "r:Shift_JIS") do |f|
    str = f.read
    puts str.encode("UTF-8")
end

# 3)
str1 = '①'
str2 = '①'

str01 = str1.encode(Encoding::Windows_31J)
p str01.force_encoding("Windows-31J").valid_encoding?

str02 = str1.encode(Encoding::Windows_31J)
p str02.force_encoding("Shift_JIS").valid_encoding?