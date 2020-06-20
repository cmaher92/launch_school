# # example of basic begin/rescue/end
# begin
#   # put code at risk of failing here
# rescue TypeError
#   # take action
# end

# # demonstration of ensure clause used for resource management
# file = open(file_name, 'w')
# begin
#   # do something with file
# rescue
#   # handle exception
# rescue
#   # handle a diffiferent exception
# ensure
#   file.close
# end

# demonstrates how to manually raise an error
begin
  raise TypeError, 'something went wrong'
rescue RuntimeError
  puts "fixed"
end