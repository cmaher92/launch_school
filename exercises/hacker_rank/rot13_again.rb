input = "Jul qvq gur puvpxra pebff gur ebnq?".split(//)

def rot13(secret_messages)
  secret_messages.map do |char|
    case char
    when /[a-m]/i then (char.ord + 13).chr
    when /[n-z]/i then (char.ord - 13).chr
    else
      char
    end
  end
end

p rot13(input)