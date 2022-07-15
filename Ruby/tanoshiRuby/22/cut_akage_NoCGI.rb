require "CGI/util"
htmlfile = "akage.html"
textfile = "akage2.txt"

html = File.read(htmlfile, encoding: "UTF-8")

File.open(textfile, "w:UTF-8") do |f|
    in_header = true
    html.each_line do |line|
        if  in_header && /<div class="main_text">/ !~ line
            next
        else
            in_header = false
        end
        break if /<div class="after_text">/ =~ line
        # ! Rubyで特殊な文字として扱われる
        # 以下、例

        # ! 例外を発生させることができる
        # https://qiita.com/ozin/items/5968971c9d2b3ab0a84d7777777777777
        # たのしいRuby p203

        # gsub! 破壊的メソッド オブジェクトの値を変えてしまうメソッド
        # https://qiita.com/tentom/items/0164b68dff94702e3880
        line.gsub!(/<[^>]+>/, "")
        f.write line
    end
end