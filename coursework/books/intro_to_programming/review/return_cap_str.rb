# input; String
# output; String; new, all-caps version of string if string is longer than 10 chars

def cap_long_str(str)
    # capitalizes str if str is longer than 10 chars
    str.size > 10 ? str.upcase : str
end

p cap_long_str('hello world')