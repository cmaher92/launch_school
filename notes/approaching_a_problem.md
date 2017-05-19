Understanding the problem:
requirements are explicit
  take notes
  the odd words problem
requirements aren't explicit and need to be modeled
  requirements are shown with examples
    examples need to be described in computational words
    diamond of stars
  implicit knowledge needs to be captured
    convert to explicit rules, in computational words
    what century is that

Input
  1 - many words
  separated by: 1 - many spaces
  terminated by:
    0 - many spaces
    followed by a period
  chars: letter, space, point, up to 20 letters
  need to handle failure?
Output
  words: have the odd words reversed
  odd means odd number words, based on 0 index
  separated by: 1 space between words
  terminated by: 0 space, follow by a period

Examples / Test Cases:
Input / Output
helps understanding the problem
allow you to verify the solution
Happy paths
 the obvious result
Edge cases
  focus on input
  emptiness (nil/null, "", [], {})
  boundary conditions
  repetition / duplication
  upcase / downcase
  data types
Failures / Bad Input
  raise exception / report errors
  return a special value (nil/null, 0, "", [] etc)
Ask questions to verify your understanding!


reverse_odd_words("hello.")               => "hello."
reverse_odd_words("hello .")              => "hello."
reverse_odd_words("hello world.")         => "hello dlrow."
reverse_odd_words("hello world .")        => "hello dlrow."
reverse_odd_words("hello  world  .")      => "hello dlrow."
reverse_odd_words("hello  hello world.")  => "hello olleh world."

Ask interviewer how to handle inputs that don't match requirements
return empty strings? throw exception?
reverse_odd_words("")                     => ""

Input number
  What happens when the number is 0
  What happens when the number is negative
  What happens when the number is even
Output
  return a string with a new line char "\n" delimiters
  prints on to the screen
Model the problem
  given an odd number n, for example, 5
  output n strings
    1, 3, 5, 3, 1
    prepend number of spaces: 2, 1, 0, 1, 2
  join together with \n, or loop and print

  Write a unction that takes an integer year as an input and returns the century. The return value should
  be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

  New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

  Input integer
    What happens when the year is 0
    What happens if it's a negative integer
    Is there a limit?
  Output string
    begins with century number
    ends with st, nd, rd, or th
  Rules
    new centuries begin in years that end with 01
    century string number into a string:
      1:     'st'
      2:     'nd'
      3:     'rd'
      4-20:  'th'
      21:    'st'
      22:    'nd'
      23:    'rd'
      24-30: 'th'
      ...
      generalize:
        century_number % 10 (if century_number were 19 it would return 9)
          1, 2, 3: st, nd, rd
          0, 4-9: th
          except:
            11, 12, 13: th

  Examples / Test Cases:
  century(1):    => '1st'
  century(100):  => '1st'
  century(101):  => '2nd' # boundaries
  century(1052): => '11th'

Write a program that given a word, computes the scrabble score for that word.

Letter Values

Letter                             Value
A, E, I, O, U, L, N, R, S, T         1
D, G                                 2
B, C, M, P                           3
F, H, V, W, Y                        4
K                                    5
J, X                                 8
Q, Z                                 10

input String
  What happens when an input is multiple words?
  What about special characters?
  What about when the input is a number
  What about when the input is not a valid word?
output integer
  calculate score based on the scoring system
    create score hash scoring = { 1: %w(a e i o u), 2: %w(d, g), 3: %w(b, c, m, p), 4: (g, h, v, w, y) etc..}
    create score var
    iterate over the string of chars and with each char check it against each object of the hash
      add the returned value for that char to the score var
    return score
rules
  the score is the sum of scores of each letter in the string
  the letter value table is used to loop up letter scores

  
score_word('dog')       => 5
score_word('      ')    => 0
score_word(12)          => 0
score_word('!@#$!@#$')  => 0
score_word('happy dog') => 0
