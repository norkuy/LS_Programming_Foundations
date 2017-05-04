def short_long_short(str1, str2)
  if str1.size > str2.size
    "#{str1}#{str2}#{str1}"
  else
    "#{str2}#{str1}#{str2}"
  end
end