htmlfile = "akage.html"
textfile = "akage.txt"

html = File.read(htmlfile, encoding: "UTF-8")

File.open(textfile, "w:UTF-8") do |f|
    in_header = true
    html.each_line do |line|
        if in_header && /<div class="main_text">/ !~ line
            next
        else
            in_header = false
        end
        # // 正規表現として文字列を扱うときに使う
        break if /<div class="after_text"/ =~ line
        f.write line
    end
end