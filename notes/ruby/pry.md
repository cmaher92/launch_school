
# Pry Cheat Sheet

**Command Line**

- `pry -r ./config/app_init_file.rb` - load your app into a pry session (look at the file loaded by config.ru)
- `pry -r ./config/environment.rb` - load your rails into a pry session

**Debugger**

- `help ls`     --  Display command options for pry command ls
- `ls <Object>` --  Show all of the available methods that can be called by an object
- `_`           --  Last eval
- `? <Object>`  --  Shows more information (doc) about an object, or method
- `_file_`      --  Represent the last file Pry touched
- `wtf?`        --  Print the stack trace, same as `_ex_.backtrace`
- `$`           --  Show source, shortcut for show-source
- `edit Class` -- Open file in $EDITOR
- `edit Class#instance_method` -- Open file in $EDITOR
- `<ctrl+r>`    --  Search history
- `_out_`       --  Array of all outputs values, also `_in_`
- `cd <var>`    --  Step into an object, change the value of self
- `cd ..`       --  Take out of a level
- `binding.pry` --  Breakpoint
- `edit --ex`   --  Edit the file where the last exception was thrown
- `.<Shell>`    --  Runs the <Shell> command
- `whereami`    --  Print the context where the debugger is stopped
- `whereami 20` --  Print the context 20 lines where the debugger is stopped
- `;`           --  Would mute the return output by Ruby
- `play -l`     --  Execute the line in the current debugging context

## pry-nav
- `next` -- execute next line
- `step` -- step into next function call
- `continue` -- continue through stack
