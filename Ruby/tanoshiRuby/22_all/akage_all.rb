# get_akage.rb XHTML版のファイルを取得し書き出す
require "open-uri"
require "CGI/util"

url = "https://www.aozora.gr.jp/cards/000009/files/8_31220.html"
filename = "akage_all.html"

p "パラメータの内容"
p ARGV
argv3 = ARGV[3].to_i
p argv3
# テキストファイルをファイルへ書き出す
File.open(filename, "wb:UTF-8") do |f|
    text = URI.open(url, "r:Shift_JIS:UTF-8").read
    f.write text
end

if FileTest.exist?("akage_all.txt")
    File.delete("akage_all.txt")
end

# cut_akage2.rb HTMLのヘッダーとタグ、全角の空白を削除
htmlfile = "akage_all.html"
textfile = "akage_all.txt"

# akage_all.htmlを開く
# ::大きなやりたいこと
html = File.read(htmlfile, encoding: "UTF-8")
File.open(textfile, "w:UTF-8") do |f|
    # ::小さいやりたいこと
    in_header = true
    # 一行ずつファイルを読み込む
    # headerがfalse/<div class="main_text">/と一致していない場合、次の行をeach_lineメソッドで判定
    # /<div class="after_text">/と一致すると、処理を終了
    html.each_line do |line|
        if  in_header && /<div class="main_text">/ !~ line # 文字列として処理してみる
            next
        else
            in_header = false
        end
        break if /<div class="after_text">/ =~ line
        # コマンドラインの引数に、数字を入れた時に分岐
        # 0. 全角スペースを特殊文字へ置き換える
        # 1. 全角スペースを特殊文字へ置き換え、CGI.unescapeHTMLを適用
        # それ以外、全角スペースを削除(特殊文字なし)
        # ::それぞれやりたいことを日本語で書く
        if argv3 == 1
        line.gsub!(/<[^>]+>/, "") # やり直し
        line.gsub!("　", "&	: &amp;  < : &lt;  > : &gt;")
        f.write line
        p "hello0"
        elsif argv3 == 2
        line.gsub!(/<[^>]+>/, "")
        line.gsub!("　", "&  : &amp;  < : &lt;  > : &gt;")
        esc_line = CGI.unescapeHTML(line)
        f.write esc_line
        p "hello1"
        elsif argv3 == 3
        line.gsub!(/<br\s.>/, "")
        line.gsub!("　", "")
        esc_line = CGI.unescapeHTML(line)
        f.write esc_line
        p "hello"
        else
        line.gsub!(/<[^>]*>/, "")
        line.gsub!("　", "")
        esc_line = CGI.unescapeHTML(line)
        f.write esc_line
        end
    end
end

# simple_match4.rb 正規表現を使って、文字の検索と表示方法の変更、単語の出現回数をカウント

# 文字列を正規表現として扱うオブジェクトを生成
pattern = Regexp.new(ARGV[0].encode("UTF-8"))
filename = ARGV[1]
# 引数を数値型へ変換
len = ARGV[2].to_i

# 文字数をカウントするための変数を初期化
count = 0

# ファイルを開く 17th
# fileはブロック変数として扱われる
File.open(filename, "r:UTF-8") do  |file|

    # each_line 入力操作をするメソッド 17th
    file.each_line do |line|
        #scanメソッド ()内のマッチした部分を配列にして取り出す
        line.scan(pattern) do |s|
            # u3000 Unicodeのコードポインタ 空白を表す https://qiita.com/hiroyuki_mrp/items/f0b497394f3a5d8a8395
            # $` マッチした文字よりも前の文字列を表す
            # $' マッチした文字よりも後ろの文字列を表す
            pre = "\u3000" * len + $`
            post = $'
            puts "#{pre[-len, len]}<<#{s}>>#{post[0, len]}"
            count += 1
        end
    end
end
puts "count: #{count}"

# 補足 : simple_match2 

# pattern = Regexp.new("(.{10})("+ARGV[0].encode("UTF-8")+")(.{10})")

# puts "#{s[0]}<<#{s[1]}>>#{s[2]}"

# キャプチャ 16th p365
# (.)任意の文字を指定
# 文字列と数字を指定してまとめることができる