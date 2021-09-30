# File#seek

> Seeks to a given offset anInteger in the stream according to the value of whence:
> Reference: https://ruby-doc.org/core-3.0.2/IO.html#:~:text=seek(amount%2C%20whence%3DIO%3A%3ASEEK_SET)%20%E2%86%92%200

- Signature:
```ruby
seek(amount, whence=IO::SEEK_SET) → 0
```

- Seeks to amount + current position:
```ruby
File.open('monk') do |f|
  f.seek(20, IO::SEEK_SET)
  p f.read(10)
end
```

- Seek to amount + end of stream (use negative integer):