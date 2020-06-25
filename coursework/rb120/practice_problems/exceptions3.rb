# regardless of if there is an error print "code finished" at the end of the
# begin/rescue block

begin
  puts 'hi'
rescue => e
  e.message
end
