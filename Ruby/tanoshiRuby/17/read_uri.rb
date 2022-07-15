require "open-uri"

filename = "ruby-2.6.1.zip"
version = filename.scan(/\d+\.\d+/).first

url = "https://cache.ruby-lang.org/pub/ruby/#{version}/#{filename}"

URI.open(url) do |remote|
    File.open(filename, "wb") do |local|
        while data = remote.read(10000)
            local.write(data)
        end
    end
end