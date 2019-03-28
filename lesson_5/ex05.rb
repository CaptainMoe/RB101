munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum_age = 0

munsters.each do |name, info|
  gender = info["gender"]
  age = info["age"]
  if gender == 'male'
    sum_age += age
  end
end

puts sum_age
