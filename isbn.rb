class Isbn
  def calculateCheckDigit(isbn: nil)
    return "Please pass an ISBN number." if isbn == nil
    has_check_digit = false
    return "Please enter the first 12 digits of the ISBN13 bar code." unless isbn.to_s.length == 12

    isbn_without_check_digit = isbn.to_i

    sum = 0
    isbn_without_check_digit.digits.each.with_index do |digit, idx|
      sum += idx % 2 == 0 ? digit * 3 : digit * 1
    end
    res = 10 - (sum % 10)

    return res unless res == 10
    return 0 if res == 10
  end

  def validISBN?(isbn: nil)
    return "Please pass an ISBN number." if isbn == nil
    return "Please enter valid ISBN13 barcode" unless isbn.to_s.length == 13

    check_digit = nil
    if isbn.to_s.length == 13
      check_digit = isbn.to_s.split('')[-1].to_i
      has_check_digit = true
    end

    isbn_without_check_digit = isbn.to_s.split('')[0..-2].join('').to_i
    result = calculateCheckDigit(isbn: isbn_without_check_digit)

    return result == check_digit
  end
end
