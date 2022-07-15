class String
    def count_word
         # selfを空白文字区切りで配列に分解する
        ary = self.split(" ")

        return ary.size
    end
end

str = "Just Another Ruby Newbie"
p str.count_word
p str.instance_of?(String)