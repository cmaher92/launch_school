# Makes files for 10 questions

num = 0

10.times do
  num += 1
  File.new("question_#{num}.rb", "w")
end