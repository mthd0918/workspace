# 1)
def get_local_and_domain(str)
    str =~ /^([^@]+)@(.*)$/
    localpart = $1
    domain = $2
    return [localpart, domain]
end

p get_local_and_domain("mthd0918@gmail.com")

# 2)
str = "正規表現は難しい！なんて難しいんだ！"
p str.gsub(/難しい/, "簡単")

# 3)
def word_capitalize(word)
    return word.split(/\-/).collect{|w| w.capitalize}.join('-')
end

p word_capitalize("in-reply-to")
p word_capitalize("X-MAILER")