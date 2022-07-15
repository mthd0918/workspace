str = "https://www.ruby-lang.org/ja/"
%r|https?://([^/]*)/| =~ str
puts "server address: #{$1}"