ary = %w(
    Mind can be observed and known. But you can know directly only your own mind, and not another's. You may look into my face and guess the meaning of the smile or frown, and so read something of the mind's activity. （　1　） that is not always right. You may learn to recognize my features, know my voice, respond to the clasp of my hand; but the mind, the consciousness, which feels my joys and sorrows, You can never know completely.
    Therefore, it follows that only you can ever know you and only I can ever know I directly. Between your consciousness and mine, there exists a wide gap that cannot be bridged. We may work together, live together, come to love or hate each other. But our mind can never be understood entirely by other people. We must live our own lives, think our own thoughts, and arrive at our own destiny.
    Then, what is mind? What is the thing that we call consciousness? The only way to know what mind is, is to look into our own consciousness and observe what is happening there. In the language of the psychologist, we must ※１introspect. Because one can never come to understand the nature of mind and its laws of working by listening to lectures or reading text books alone. There is no psychology in the text, but only in your living, flowing stream of thought and mine. Indeed, the lecture and the book may tell us what to look for when we introspect, and how to understand what we find. But the descriptions about our minds must be confirmed by our own observation and experience.
)

call_num = 0
sorted = ary.sort do |a, b|
    call_num += 1
    a.length <=> b.length
end

puts "ソートの結果 #{sorted}"
puts "配列の要素数 #{ary.length}"
puts "ブロックの呼び出し回数 #{call_num}"