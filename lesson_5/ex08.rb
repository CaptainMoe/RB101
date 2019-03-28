hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |str|
    str.chars.each{|ch| puts ch if ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u'].include?(ch)}
  end
end
