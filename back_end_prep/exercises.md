# A central repository for all of the exercises from the Programming & Back-end Prep course

1. Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |value| puts value }

* 2.
arr.each { |value| puts value if value > 5}

or

arr.each do |value|
  if value > 5
    puts value
  end
end

3.
only_odds = arr.select do |value|
  value % 2 != 0
end

or

only_odds = arr.select { |value| value % 2 != 0 }

4. Append "11" to the end of the original array. Prepend "0" to the beginning.
arr.push(11)
arr.unshift(0)

5. Get rid of "11". And append a "3".
arr.pop
arr.push(3)

6. Get rid of duplicates without specifically removing any one value.
arr.uniq

or arr.uniq! to manipulate the caller

7. What's the major difference between an Array and a Hash?
The major difference between an array and a hash is the way items are stored in each data type.
An array's items are stored by index in order.
A hash stores it's items by an associated key. Each item being referred to as a key value pair.

8. Create a Hash using both Ruby syntax styles.
older_way = { :first_name => "Connor" }
newer_way = { first_name: "Connor" }

9. Suppose you have a hash h = {a:1, b:2, c:3, d:4}
  1. Get the value of key `:b`.
  h[:b]

  2. Add to this hash the key:value pair `{e:5}`
  h[:e] = 5

  3. Remove all key:value pairs whose value is less than 3.5
  h.delete_if { |key, value| value < 3.5 }

10. Can hash values be arrays? Can you have an array of hashes? (give examples)
Yes.
hash = {names: ['bob', 'joe', 'susan']}
array = [{:first_name = "Connor"}, {:last_name = "Maher"}, {:date = "March"}]

11. Look at several Rails/Ruby online API sources and say which one you like best and why.
api.rubyonrails.org The guides seem to be well written, although the API itself seems slightly confusing at first glance but still better then apidock.

12. Given the following data structures. Write a program that moves the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

13. Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number?

contacts["Joe Smith"][:email]
contacts["Sally Johnson"][:phone]

14. In exercise 12, we manually set the contacts hash values one by one. Now, programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array. Hint: you will probably need to iterate over ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.

Note that this exercise is only concerned with dealing with 1 entry in the contacts hash, like this:
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do |field|
    hash[field] = contact_data.shift
  end
end

15. 
