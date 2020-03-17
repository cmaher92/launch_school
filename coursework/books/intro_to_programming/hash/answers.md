# Answers from quiz

1.
A hash is a data structure that stores items by associated keys.
Arrays store items by an ordered index.

2.
A key-value pair, creating an associative representation of data

3. 
Symbols and Data types

4. 
Curly-braces, commas

5. 
person = {:height => '5ft 10in'}

6. 
person = {height: '5ft 10in'}

7.
person[:hair] = 'brown'

8. 
person.delete(:weight)

9.
person[:height]

10.
person.merge(other_hash)

11. 
animal = {type: 'lion', sex: 'male', age: 19 }
animal.each do |key, value|
  "The animal is a #{key} #{value}"
end

12.
def printer(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name} and I'm #{options[:age]}"
  end
end

13.
No

14. 
printer("Connor", 24)


end
