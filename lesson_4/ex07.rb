statement = "The Flintstones Rock"

freq = Hash.new(0)
letters = ('A'..'Z').to_a + ('a'..'z').to_a

statement.chars.each do |char|
  freq[char] += 1 if letter.include(char)
end

freq
