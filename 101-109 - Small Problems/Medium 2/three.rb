def letter_percentage(str)
  str_chars = str.chars
  percent_hash = {}
  capitalized = 0.0
  lowercase = 0.0
  neither = 0.0
  str_chars.each do |char|
    if char =~ /[A-Z]/
      capitalized += 1
    elsif char =~ /[a-z]/
      lowercase += 1
    elsif char =~ /\W+/
      neither += 1
    end
  end
  percent_hash[:capitalized] = ((capitalized / str_chars.size) * 100).round(2)
  percent_hash[:lowercase] = ((lowercase / str_chars.size) * 100).round(2)
  percent_hash[:neither] = ((neither / str_chars.size) * 100).round(2)
  percent_hash
end

# [^A-Za-z] - not equal to uppercase or lowercase letter