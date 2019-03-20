flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

short_name = []
flintstones.each do |name|
  short_name << name[0, 3]
end

short_name
