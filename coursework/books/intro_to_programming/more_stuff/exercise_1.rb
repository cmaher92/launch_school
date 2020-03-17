# Exercise 1

# Write a program that checks if the sequence of characters'lab' ecists in the strings. if it exists, print the word.

def check_lab(word)
  if word =~ /lab/
    puts 'we have a match'
  else
    puts word
  end
end

check_lab 'laboratory'
check_lab 'experiment'
check_lab 'Pans Labyrinth'
check_lab 'elaborate'
check_lab 'polar bear'
