# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
require_relative 'todo'

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "can only add ToDo objects" unless todo.instance_of?(Todo)
    @todos << todo
    @todos
  end
  
  def <<(todo)
    add(todo)
  end
  
  def size
    @todos.size
  end
  
  def first
    @todos.first
  end
  
  def last
    @todos.last
  end
  
  def to_a
    @todos
  end
  
  def done?
    @todos.all?(&:done?)
  end
  
  def item_at(index)
    @todos.fetch(index)
  end
  
  def mark_done_at(index)
    item_at(index).done!
  end
  
  def mark_undone_at(index)
    item_at(index).undone!
  end
  
  def done!
    @todos.each(&:done!)
  end
  
  def shift
    @todos.shift
  end
  
  def pop
    @todos.pop
  end
  
  def remove_at(index)
    item = @todos.fetch(index)
    @todos.delete(item)
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def each
    @todos.each { |todo| yield(todo) }
    self
  end
  
  def select
    results = []
    
    each { |todo| results << todo if yield(todo) }
    
    results
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

list << (todo3)

p list.size == 4

p list.done?

# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# p list.select { |todo| todo.done? }