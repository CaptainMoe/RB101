uuid_section = [8, 4, 4, 4, 12]
possible_values = Array('a'..'f') + Array('0'..'9')

uuid = ''
uuid_section.each do |n|
  n.times do
    uuid << possible_values.sample
  end
  uuid << '-' unless n == 12
end

p uuid
