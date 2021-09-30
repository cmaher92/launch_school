# File

> Subclasses from IO.
> Reference: https://rubymonk.com/learning/books/1-ruby-primer/chapters/42-introduction-to-i-o/lessons/90-using-the-file-class  
  
- Opening and closing:
```ruby
mode = 'r+' # read-write
file = File.open('friends-list.txt', mode)
file.close
```

- Opening and closing by passing a block:
```ruby
File.open('friends-list.txt', 'r+') do |file|
  # file manipulation code
end
```

- Reading and writing:
```ruby
file = File.open('master', 'r+')
buffer = ''

# (length of bytes, buffer)
file.read(23, buffer) # buffer will be written to
```

