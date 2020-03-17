# Question 7

names = ['connor', 'megan', 'avery', 'john', 'cassie', 'erin', 'geyliah', 'chris']
interviewers = ['sarah', 'alex', 'derek']

p names.product(interviewers).shuffle

# The product method combines all combinations of elements, and returns an array of the combinations. So for the problem where the interviewer needs to see each candidate this method is perfect. I then shuffle the combinations because, well, I wanted to.
