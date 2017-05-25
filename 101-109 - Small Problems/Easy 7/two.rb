def letter_case_count(str)
  letter_hash = {}
  letter_hash['lowercase'] = str.count("a-z")
  letter_hash['uppercase'] = str.count("A-Z")
  letter_hash['neither'] = str.delete(' ').scan(/\W/).count

end

letter_case_count('THIS is a SEN%$#TENCE.')