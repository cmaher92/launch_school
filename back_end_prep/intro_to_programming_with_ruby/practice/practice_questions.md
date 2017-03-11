# Practice questions
# Used to review both explaining and applying concepts

Create a loop that asks for a number between 1 and 10, if the number is not between 1 and 10 repeat.
Explain the loop that is ideal, and give reasoning to backup your selection.

Create a loop that counts down from 100. 
Explain the loop that is ideal, and given reasoning to backup your selection.

Create a loop that counts from 0 to the number the user gives.
Explain the loop that is ideal, and give reasoning to backup your selection.

Iterate over an array of ages, print the total number of people that are over 21.
What is the benefit in using the array methods opposed to a for loop?
people = [21, 36, 43, 66, 22, 14, 12, 8, 6, 5, 4, 3, 21, 24, 25, 26]

Given an array of people, each index represents their seat numnber at a dinner and each item represents their age, print a list
of people and their seat numbers of people that are old enough to drink.
people = [21, 36, 43, 66, 22, 14, 12, 8, 6, 5, 4, 3, 21, 24, 25, 26]

Given an array of names, each name representing the name of a guest that has RSVPed ahead of time, how can you quickly check the list to see if a guest is on the list.
guests = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']

Given both a list of interviewees and interviewers create an array that assigns each interviewee with an interviewer shuffled. Expain how and why.
names = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']
interviewers = ['sarah', 'alex', 'derek']

Given a list of names, return the index of the value 'cassie'. 
names = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']

Given the same list of names, return the item located at the fifth position.
names = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']

Given two arrays --names and ages-- create a hash with the names as the keys and the ages as the values.
names = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']
ages = [25, 20, 17, 46, 46, 23, 23, 22]

Using the hash created above please add 'kyle' who is 24. 

Using the same hash as above remove 'megan'.

Check if erin is on the list.

Retrieve the age of Erin from the hash.

Quickly retrieve Cassies age.

Return the keys for the hash.

Select both avery and megan from the hash, what is returned? What is returned when avery, megan and charles is selected from the list when charles isnt currently on the list?

You are a coach for a soccer team and each player is represented as a hash, recently your scout just reported additonal information about your player. Given two hashes, please add the new information to the players hash without having to create a new hash for the player.
derek = { age: 24, height: '74 inches', goals: 22, assists: 17 }
new_information = { recruited: true, state: 'MA', rating: 8 }

After the scout dropped off the paperwork he said that the assists totals were not accurate and he was going to do some more research, please remove the assits from the players hash.

A new user has just signed up to your application and you want to given him a personalized greeting based on the information he has provided on sign-up. Given that some of the information is optional create a method that greets the user by email if no name is given, but if a name and place are given please greet him by name and comment on what a nice place it is that he lives at.

if only the name is provided but the location is not just welcome him by name. (This is a good way to check the hash deeply opposed to just checking if its empty like in the examples). 

