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
    list = TodoList.new(self.title)
    
    self.each do |todo| 
      list.add(todo) if yield(todo)
    end
    
    list
  end
  
  def find_by_title(str)
    selected = self.select { |todo| todo.title == str }.first
  end
  
  def all_done
    self.select(&:done?)
  end
  
  def all_not_done
    self.select { |todo| !todo.done? }
  end
  
  def mark_done(str)
    find_by_title(str).done! if find_by_title(str)
  end
  
  def mark_all_done
    self.each(&:done!)
  end
  
  def mark_all_undone
    self.each(&:undone!)
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

list.mark_done_at(1)            # marks the 2nd item as done

# p list.select { |todo| todo.done? }
# p list.each { |todo| puts todo }

# puts list.find_by_title('Buy milk')
# puts list.all_done
# puts list.all_not_done
# puts list
# list.mark_done('Go to gym')
puts list
list.mark_all_undone
puts list