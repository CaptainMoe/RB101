hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

color_size = []

hsh.each do |produce, info|
  if info[:type] == 'fruit'
    color_size << info[:colors].map{|color| color.capitalize}
  else
    color_size << info[:size].upcase
  end
end

p color_size
