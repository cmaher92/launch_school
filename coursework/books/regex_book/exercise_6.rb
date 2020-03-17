# Write a method that changes dates in the format
# 2016-06-17
# to the format
# 17.06.2016

# def format_date(date)
#   date.split('-').reverse.join('/')
# end

def format_date(date)
  date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)
