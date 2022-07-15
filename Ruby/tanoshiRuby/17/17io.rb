# 1)
 def wc(file)
    nline = nword = nchar = 0
    File.open(file){|io|
        io.each{|line|
        words = line.split(/\s+/).reject{|w| w.empty?}
        nline += 1
        nword += words.length
        nchar += line.length
        }
    }
    puts "lines=#{nline} words=#{nword} char=#{nchar}"
end

wc(__FILE__)

# 2)a
def reverse(input)
    open(input, "r+") do |f|
        lines = f.readlines
        f.rewind
        f.truncate(0)
        f.write lines.reverse.join()
    end
end

reverse(ARGV[0])

# b
def reverse(input)
    open(input, "r+") do |f|
      lines = f.readlines
      f.rewind
      f.truncate(0)
      f.write lines.reverse.join()
    end
end

reverse(ARGV[0])

# c
def reverse(input)
    open(input, "r+") do |f|
        lines = f.readlines
        f.rewind
        f.truncate(0)
        f.write lines.reverse[0]
    end
end

reverse(ARGV[0])

# 3)
def tail(lines, file)
    queue = Array.new
    open(file) do |io|
      while line = io.gets
        queue.push(line)
        if queue.size > lines
          queue.shift
        end
      end
    end
    queue.each{|line| print line }
  end
  
  puts "==="
  tail(10, __FILE__)
  
  puts "==="
  tail(3, __FILE__)