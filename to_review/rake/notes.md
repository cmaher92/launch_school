# - imagine we have a directory full of .md files that we want to convert to .html files
#   using pandoc.

# Example as a regular script:
# %W[ch1.md ch2.md ch3.md].each do |md_file|
#   html_file = File.basename(md_file, ".md") + ".html"
#   system("pandoc -o #{html_file} #{md_file}")
# end

# to invoke the below example:
# `$ rake ch1.html`

# Here's how the above script would be written as a Rake task:
```ruby
['ch1.md', 'ch2.md', 'ch3.md'].each do |md_file|
  html_file = File.basename(md_file, '.md') + '.html'
  file html_file => md_file do # html_file is the argument, dependent on md_file
    sh "pandoc -o #{html_file} #{md_file}"
  end
end
```

# Rake::DSL#file(*args, &block)
# - declares a file task
# file method's block argument
# - tells rake how to get an html file from a markdown file (pandoc)

# benefits:
# - rake shows the command being run
# - rake will not build file again if the file has not been modified
# -

**`#Rake::DSL#task`**
 - declare a basic task.

 method signature:
 - `task(task_name)`
 - `task(task_name: dependencies)`
 - `task(task_name, arguments -> dependencies)`

 `task_name`:
 - always the first argument
 - symbol or string
 - if `task_name` contains a `:` it is defined in that namespace

 `dependencies`:
 - may be a single task name
 - or an array of task names

 `argument` (single task name) `arguments` (array of task names):
 - define the arguments provided to the task

 a task with a single dependency:
 ```ruby
task clobber: %w[clean] do # clobber (task_name) contains : indicating its defined here
  rm_rf 'html'
end
```

a task with an argument and a dependency:
```ruby
task :package, [:version] => :test do |t, args|
  # ...
end
```
- `:version` is the argument which defines the arguments provided to task
- `:test` is the dependency
- invoked with `$ rake package[1.2.3]`
