# Review for File#expand_path
# current directory is 
# /Users/cmaher/Development/launch_school/exercises/my_practice
# current file is file_expand_path.rb

# what would the following return?
p File.expand_path('..')

# what about this?
p File.expand_path('..', __FILE__)

# Now what about this?
p File.expand_path(__FILE__)
