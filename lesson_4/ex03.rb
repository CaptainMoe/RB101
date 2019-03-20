ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

total_age = 0

ages.each do |name, age|
  total_age += age if age < 100
end

total_age
