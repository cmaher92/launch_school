# Scope

## Terminology

| Term  | Definition                                                   |
| ----- | ------------------------------------------------------------ |
| scope | refers to what variables are available at any given point in time |



## Local Variable Scope

> A local variable’s scope is the block, method definition or program (whichever is ‘smaller’) in which it was first defined.

Local variables defined within a block do not leak to the surrounding scope.

```ruby
1.times do
  a = 1
end

local_variables.empty? # => true
```

Local variables defined in an outer scope appear within the inner scope.

```ruby
a = 1

1.times do
  puts a
end

# 1
```

