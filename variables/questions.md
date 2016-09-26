* 1. What is a variables sole purpose?
Label and store data in memory

2. Assign a variable to the String 'Joe'
first_name = 'Joe'

3. If I assign the value 4 to variable 'a', then assign the variable 'a' to the variable 'b', then reassign the value of 7 to the variable 'a' what is the value of 'b'?
a = 4
b = a
a = 7
b
# => 4

4. Does a variable point to the value in memory or does the value point to the variable?
A variable points the the value in memory. 

5. What method can I use to get information from the user?
gets
name = gets

6. What will the above method return?
If I were to enter Connor it would return "Connor\n"

7. Use the above method to assign a value to name from the user, without returning a newline character. 
user = gets.chomp

8. Where is a variable's scope defined?
Where it's initialized or created.

9. In the following code snippet what will be printed to the screen?

arr = [1, 2, 3]
for i in arr do
  a = 5
end 

puts a

#=> a = 5

10. Define a constant
GAS = 4.4

11. What is a constant used for?
Storing data that never needs to change

12. Define a global variable
$var = "I am available througout your app."

13. Define a class variable
@@var = "I am available throughout instances of the class and the class itself"

14. Where is a class variable accessible?
Throughout the class itself and instances of that class

15. Why would you use a class variable?
You would use a class variable when each instance would not need its own value for that variable.

16. Define an instance variable.
@var = "Available throughout the current instance of the parent class"

17. Where is an instance variable accessible?
Throughout the current instance of the parent class. 
