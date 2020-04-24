# Blocks

## Terminology

| Term  | Definition                                          |
| ----- | --------------------------------------------------- |
| Block | Anonymous functions that can be passed into methods |
|       |                                                     |
|       |                                                     |

## Understanding Ruby Blocks

Blocks are enclosed in `do..end` statement or between brackets `{..}` and they can have multople arguments.

Argument names are dfined between two `|` pipe characters.

## `yield` Keyword

`yield` is a *ruby keyword* that calls a block when you use it. It's how methods use blocks. Essentially when you use the `yield` keyword, the code inside the block will run and do its work.

```ruby
def print_once
  yield
end

print_once { puts "Block is being run }
```

You can pass any number of arguments to `yield`, which then become the blocks arguments.

```ruby
def one_two_three
  yield 1
  yield 2
  yield 3
end

one_two_three { |number| puts number }
# 1, 2, 3
```

