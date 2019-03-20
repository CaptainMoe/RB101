require 'pry'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  age = munsters[name]['age']
  if age < 18
    munsters[name]['age_group'] = 'kid'
  elsif age > 17 &&  age < 65
    munsters[name]['age_group'] = 'adult'
  elsif age > 64
    munsters[name]['age_group'] = 'senior'
  end
end

p munsters
