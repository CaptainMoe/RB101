words = "the flintstones rock"

title = words.split.map do |word|
  word.capitalize
end

title.join(' ')
