# Questions

1. Create a new text file with read and write access
my_file = File.new('test.txt', 'w+')

2. Where will the file be created?
In the current directory that IRB is running

3. What happens if you don't close a file that you create?
If not closed it will continue to occupy space in memory.

4. Open a file.
File.open('test.txt', 'r')

5. What does 'r' mean?
Read only, starts at the beginning of the file

6. What does 'w' mean?
Write only, if the file exists, overwrites everything in the file

7. What does 'w+' mean?
Read & Write, if the file exists, overwrites everything in the file

8. What does 'a+' mean?
Read-write, if the file exists, starts at the end of the file. Otherwise creates a new file

9. How do you read an entire file?
File.read('test.txt')

10. How do you read an entire file based on individual lines, returning those lines in an array?
File.readlines('test.txt')

11. Open a file, then invoke a block that writes contents to the file.
File.open("test.txt", "w") { |file| file.write("Adding the first line of text") }

12. Open the file, write to it and finally close it without invoking a block.
my_file = File.open("test.txt", "w")
my_file.write("Completing problem number 12")
my_file.close

13. Open the file for reading and updating, declare a variable file, append more text to it.
my_file = File.open("test.txt", "a+")
my_file.puts "sup"

14. Create a file, then delete the file.
my_file = File.new("test.txt", 'w+')
my_file.delete("test.txt")

15. Read a file and save to a variable, create a new file, open and print the content of the read file to the new file. Now read the new file to ensure the information was saved.
read_file = File.read("test.txt", "a+")
new_file = File.new("testing.txt", "w+")
File.open("testing.txt", "a+") { |file| file.write(read_file) }

16. What are the three keys to files working properly?
Right stuff
Right kind of file
Right place

17. In ruby what is the File class a subclass of?
IO, a class responsible for representing bidirectional streams

18. Which class is an interface for manipulating directories and their contents?
Dir

19. What class is for linking files and directories?
Pathname

20. Create a file, create a pathname passing in the file, then find the pathnames extension.
new_file = File.new("testing.txt", "w+")
pathname = Pathname.new(new_file)
pathname.extname

21. What method could you call on the File instead that works the same?
File.extname("testing.txt")

22. Check the current directory for all files that have the extension .rb
d = Dir.new(".")
while file = d.read do
 puts "#{file} has extension .txt" if File.extname(file) == ".txt"
end
