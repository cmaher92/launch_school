def select_letter(sentence, letter)
  selected = ''
  counter = 0
  loop do
    break if counter == sentence.length
    selected << sentence[counter] if sentence[counter] == letter
    counter += 1
  end
  selected
end

question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') == "aaaaaaaa"
p select_letter(question, 't') == "ttttt"
p select_letter(question, 'z') == ""