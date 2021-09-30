# IO

> The IO class is the basis for all input and output in ruby.
> Reference: https://ruby-doc.org/core-3.0.2/IO.html#method-c-sysopen  
  
- Get file descriptor and create stream using file descriptor:
```ruby
# get file descriptor
fd = IO.sysopen('new-fd', 'w') # => 5

# create stream using file descriptor
IO.new(fd) # => <#IO:fd 5>
```

- Retrieve initialized streams:
```ruby
io_streams = []
ObjectSpace.each_object(IO) { |stream| io_streams << stream }
# => [#<IO:<STDERR>>, #<IO:<STDOUT>>, #<IO:<STDIN>>, #<IO:fd 9>, ...]
```

- Return an integer representing numeric file descriptor:
```ruby
STDIN.fileno   # => 0
STDOUT.fileno  # => 1
STDERR.fileno  # => 2
```

- Use `StringIO` to capture `STDERR` so that calls to warn are redirected to custom obj:
```ruby
capture = StringIO.new # create new IO obj
$stderr = capture      # reassign $stderr to point to StringIO instance 'capture'
```

