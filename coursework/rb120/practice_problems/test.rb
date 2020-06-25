begin
  raise "hi"
rescue => e
  puts e.class
  puts e.message
end
