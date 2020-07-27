# Method Lookup Path

## Sources

[Launch School - OOP Book](https://launchschool.com/books/oo_ruby/read/the_object_model)

---

## Terminology

| Term | Definition |
| ---- | ---------- |
|      |            |
|      |            |

## Notes

Method Lookup Path is the order in which classes are inspected when you call a method.

```ruby
module Displayable
end

class Participant
end

class Dealer
  include Displayable
end

class Player < Participant
  include Displayable
end

class Computer < Participant
end

player = Player.new
player.ancestors
# => Player
# => Displayable
# => Participant
# => Object
# => Kernel
# => BasicObject
```

The above shows that the method lookup path for the `player` object is first it checks it's class definition `Player` then the mixed in module `Displayable` then it's superclass `Participant`, `Object`, `Kernel` and finally `BasicObject`. 



If there are multiple modules the most recent included module will be traversed first.

```ruby
class Participant
  include Dealable
end

class Player < Participant
  include Displayable
  include Requestable
end

Player.new.ancestors
# => Player
# => Requestable
# => Displayable
# => Participant
# => Dealable
# => Object
# => Kernel
# => BasicObject
```

There are several interesting things about the above output. First, this tells us that **the order in which we include modules is important**. Ruby actually looks at the last module we included *first*. This means that in the rare occurrence that the modules we mix in contain a method with the same name, the last module included will be consulted first. Second, the module included in the superclass made it onto the method lookup path.



