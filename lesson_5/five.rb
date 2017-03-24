munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


# my answer

total_age = 0
 
males = munsters.select do |key, value|
  value["gender"] == "male"
end

males.each do |key, value|
  total_age += value["age"]
end

total_age

# answer

total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444


# access inner key values of munsters' hash

# munsters.each do |key, value|
#   value.each do |key2, value2|
#     puts key
#   end
# end