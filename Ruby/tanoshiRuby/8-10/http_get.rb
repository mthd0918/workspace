require "net/http"
require "uri"
url = URI.parse("https://www.ruby-lang.org/ja/")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
doc = http.get(url.path)
puts doc.body