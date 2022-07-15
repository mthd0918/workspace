require "open-uri"

url = "https://www.aozora.gr.jp/cards/000009/files/8_31220.html"
filename = "akage2.html"

# テキストファイル
File.open(filename, "wb:UTF-8") do |f|
    text = URI.open(url).read
    f.write text
end