
# OptionParser
-   class for command-line option analysis.
-   allows you to write code that both specifies the arguments
    and what to do with those arguments in the same place.
-   arguments can be converted to a specified class.
-   arguments can be restricted to a certain set.

`require 'optparse'`

## `make_switch`
```ruby
make_switch( opts, block = nil )
```
-   Creates a `OptionParser::Switch` from the parameters.
-   The parsed argument value is passed to the given block, where it can be processed.
  
`opts` can include the following elements:
1.   Argument style:
One of the following; `:NONE`, `:REQUIRED`, `:OPTIONAL`.  

2.   Argument pattern: 
Acceptable option argument format, must be pre-defined with `#accept`, or `Regexp`. This can appear once or assigned as String if not present, otherwise causes an ArgumentError.
`Float, Time, Array`

3.   Possible argument values: Hash or array.

```ruby
# Hash or Array
%w[is-2022-jp shift_jis euc-jp utf8 binary]
{ "jis" => "iso-2022-jp", "sjis" => "shift_jis" }
```

- Long style switch: Specified a long style switch which takes a mandatory, optional, or no argument. It's a string of the following form:

```
"--switch=MANDATORY" or "--switch MANDATORY"
"--switch=[=OPTIONAL]"
"--switch"
```

```ruby
# Specifies an optional option argument
parser.on("-i", "--inplace [EXTENSION]",
          "Edit ARGV files in place",
          "(make backup if EXTENSION supplied)") do |ext|
  self.inplace = true
  self.extension = ext || ''
  self.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
end
```

- Short style switch: Specifies a short style switch which takes a mandatory, optional, or no argument. It's a string of the following form:

```
"-xMANDATORY"
"-x[OPTIONAL]"
"-x"
```

- Description: description string for the option. `"Ruby verbosely"`. If multiple strings given, each string will be printed line by line.
- Handler: Handler for the parsed argument value. Either give a block or pass a Proc or Method as an argument.

