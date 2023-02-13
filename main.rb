def calculateCheckDigit(isbn: nil)
  return "Please pass an ISBN number" if isbn == nil
  has_check_digit = false
  check_digit = nil
  if isbn.to_s.length == 13
    check_digit = isbn.to_s.split('')[-1].to_i
    has_check_digit = true
  end
  unless has_check_digit
    pp "Please enter valid ISBN13 barcode" and return unless isbn.to_s.length == 12
  end

  isbn_without_check_digit = isbn.to_i unless has_check_digit
  isbn_without_check_digit = isbn.to_s.split('')[0..-2].join('').to_i if has_check_digit
  sum = 0
  isbn_without_check_digit.digits.each.with_index do |digit, idx|
    sum += idx % 2 == 0 ? digit * 3 : digit * 1
  end
  res = 10 - (sum % 10)

  if has_check_digit
    return "The ISBN13 barcode #{isbn} is wrong and the correct one should be #{isbn_without_check_digit}#{res}" if res != check_digit
    return "The ISBN13 barcode #{isbn} is valid" if res == check_digit
  end

  return "Complete ISBN13 barcode: #{isbn_without_check_digit}#{res}" unless res == 10
  return "Complete ISBN13 barcode: #{isbn_without_check_digit}#{0}" if res == 10
end

pp calculateCheckDigit() # this test should return 'Complete ISBN: 9780143007234'
