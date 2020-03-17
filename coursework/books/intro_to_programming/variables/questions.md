* 1. What is a variables sole purpose?
Label and store data in memory

2. Assign a variable to the String 'Joe'
Name = 'Joe'

3. If I assign the value 4 to variable 'a', then assign the variable 'a' to the variable 'b', then reassign the value of 7 to the variable 'a' what is the value of 'b'?
a = 4
b = a
a = 7
#> 4

4. Does a variable point to the value in memory or does the value point to the variable?
variables point to values in memory

5. What method can I use to get information from the user?
.gets

6. What will the above method return?
It will return what the user types in + a \n character

7. Use the above method to assign a value to name from the user, without returning a newline character.
name = gets.chomp

8. Where is a variable's scope defined?
By where the variable is initialized or created

9. In the following code snippet what will be printed to the screen?
arr = [1, 2, 3]
for i in arr do
  a = 5
end

puts a
=> 5


10. Define a constant
NAME = 'Connor'

11. What is a constant used for?
Constants are used for storing data that never needs to change

12. Define a global variable
$NAME = Global variables are available throughout the app and are typically avoided

13. Define a class variable
@@NAME = When you need to declare a variable that is related to a class, but each instance of that class does not need its own value for this variable, you use a class variable.

14. Where is a class variable accessible?
accessible by instances of your class, as well as the class itself.

15. Why would you use a class variable?
When each instance of that class does not need its own value for this variable

16. Define an instance variable.
@instance = this is an instance variable

17. Where is an instance variable accessible?
available throughout the current instance of the parent class.
