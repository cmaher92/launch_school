# Makes files for questions

num = 0

6.times do
  num += 1
  file = File.new("question_#{num}.rb", "w")
  file.puts("# question_#{num}")
  file.close
end