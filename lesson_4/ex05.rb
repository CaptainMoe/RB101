flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = 0

flintstones.each_with_index do |name, idx|
  index = idx if name.start_with?('Be')
end
