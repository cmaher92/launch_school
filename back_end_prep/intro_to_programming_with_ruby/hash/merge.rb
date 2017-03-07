# Merge
# Look at Ruby's merge method. Notice that it has two versions.
# What is the difference between merge and merge!? Write a program that uses both
# and illustrate the differences

dog = {name: 'scout', type: 'springer-spaniel', sex: 'male'}
cat = {name: 'fred', type: 'golden', sex: 'male'}
# {:name=>"fred", :type=>"golden", :sex=>"male"}
p dog.merge(cat)
# NOTE: notice how the hash being merged into the old hash overwrites the old values
