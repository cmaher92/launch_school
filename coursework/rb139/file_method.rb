
def open_close(file)
  file = File.open(file, 'w')
  yield(file)
  file.close
end

open_close('test.txt') { |file| file.write "test 123" }
