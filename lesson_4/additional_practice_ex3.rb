ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }


# my answer
older_than_100 = ages.select do |_, value|
  value < 100
end

puts older_than_100

# answer
ages.keep_if { |_, age| age < 100 }

