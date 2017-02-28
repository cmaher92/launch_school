# roman to int takes roman nums and turms them into ints

require 'pry'

def roman_to_int roman_numerals
  roman_numerals = roman_numerals.downcase
  number = 0
  is_roman = is_roman? roman_numerals
  if is_roman == false
    puts 'Please enter a valid roman numeral'
    return
  end

  number = 0
  prev_numeral = ''

  # check if previous numeral was less than current numeral
  roman_numerals.each_char do |numeral|
    # binding.pry
    if numeral == 'm'
      if prev_numeral == 'c'
        number += 800
        prev_numeral = numeral
      else
        number += 1000
        prev_numeral = numeral
      end
    elsif numeral == 'd'
      if prev_numeral == 'c'
        number += 300
        prev_numeral = numeral
      else
      number += 500
      prev_numeral = numeral
      end
    elsif numeral == 'c'
      if prev_numeral == 'x'
        number += 80
        prev_numeral = numeral
      else
        number += 100
        prev_numeral = numeral
      end
    elsif numeral == 'l'
      if prev_numeral == 'x'
        number += 30
        prev_numeral = numeral
      else
        number += 50
        prev_numeral = numeral
      end
    elsif numeral == 'x'
      if prev_numeral == 'i'
        number += 8
        prev_numeral = numeral
      else
        number += 10
        prev_numeral = numeral
      end
    elsif numeral == 'v'
      if prev_numeral == 'i'
        number += 3
        prev_numeral = numeral
      else
        number += 1
        prev_numeral = numeral
      end
    elsif numeral == 'i'
      number += 1
      prev_numeral = numeral
    end
  end
  return number
end

def is_roman? roman_string
    valid_numeral = true
    roman_string.each_char do |numeral|
      # check if numeral is a proper roman numeral
      # if not return false
      if numeral == 'm'
        next
      elsif numeral == 'i'
        next
      elsif numeral == 'v'
        next
      elsif numeral == 'x'
        next
      elsif numeral == 'l'
        next
      elsif numeral == 'c'
        next
      elsif numeral == 'd'
        next
      else
        valid_numeral = false
      end
    end
    return valid_numeral
end

puts roman_to_int 'cm'
puts roman_to_int 'l'
puts roman_to_int 'd'
puts roman_to_int 'xl'
puts roman_to_int 'xliii'
puts roman_to_int 'cmxliv'
puts roman_to_int 'mcmxcix'
