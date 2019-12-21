# [Ruby In Depth](https://www.theodinproject.com/courses/ruby-programming/lessons/how-this-course-will-work-ruby-programming)

- I'm spending too long on writing notes, so this time I'll not be doing any explanations. Will spam links and write short phrases that hopefully are succinct.

### Aims:

- Ruby ability to be able to debug problems when using frameworks
- OOP concepts
- I chose to follow the longer path instead of zooming through. Should be done in 5 days or so I hope

### Resources:

**_Contents:_**

- [Ruby In Depth](#ruby-in-depth)
    - [Aims:](#aims)
    - [Resources:](#resources)
  - [Ruby Building Blocks](#ruby-building-blocks)
    - [Basic Syntax](#basic-syntax)
      - [Loops and Iterators:](#loops-and-iterators)
      - [Array Methods](#array-methods)
      - [Hashes](#hashes)
      - [Ruby Symbols](#ruby-symbols)
      - [Methods](#methods)
      - [Ruby Specialties](#ruby-specialties)
      - [Ruby Procs](#ruby-procs)
- [==&gt; [1, 8, 27]](#gt-1-8-27)
- [==&gt; [64, 125, 216]](#gt-64-125-216)
- [==&gt; [1, 2, 3]](#gt-1-2-3)
        - [Mixins : imitating multiple inheritance](#mixins--imitating-multiple-inheritance)
    - [Time class](#time-class)
  - [Regex](#regex)
    - [Metacharacters](#metacharacters)

  - [Time class](#time-class)
  - [Regex](#regex)

    - [Metacharacters](#metacharacters)

  - [Time class](#time-class)
  - [Regex](#regex)

    - [Metacharacters](#metacharacters)

  - [Time class](#time-class)
  - [Regex](#regex)

    - [Metacharacters](#metacharacters)

  - [Time class](#time-class)

  - [Basic OOP Concepts](#basic-oop-concepts)

    - [Modules:](#modules)

  - [Basic OOP Concepts](#basic-oop-concepts)

  - [Basic OOP Concepts](#basic-oop-concepts)

  - [Basic OOP Concepts](#basic-oop-concepts)

    - [Ruby Lambdas](#ruby-lambdas)

  - [Basic OOP Concepts](#basic-oop-concepts)

---

## Ruby Building Blocks

- Codeacademy Tutorial for syntax revision

### Basic Syntax

- `print` simply prints, no new line at the end of your printing, `puts` will add a new line
- `unless` statements in Ruby: doesn't give you infinite recursion!!
- `gsub`: can't put spaces b/w the `gsub` and the parentheses

#### Loops and Iterators:

- `loop` will invode an infinite loop, then you can keep doing until some specified `break` condition is met

- `until` loop, like a backward while loop
- **_there is no `++` in Ruby_** but the `+=` shortforms still exist

* inclusive range: `for num 1..10` exclusive range: `for num 1...10`

* curly braces are _generally_ interchangable with `do` and `end` keywords

* controlling iterations using `break`, `next` and `continue`

#### Array Methods

- `.each` iterator for arrays : the placeholder param within `||`
- `.times` itrator

#### Hashes

- two ways to construct:

  - literal notation : `new_hash = { "one" => 1 }`
  - hash constructor notation: `new_hash = Hash.new`

- usual default value for keys that don't exist will be `nil`. Unless you input a default param when constructing the Hash:

  - `my_hash = Hash.new("Trady Blix")` **nb: the input param is the Value and not the key!**

- hash selection:

  ```ruby
  grades = { alice: 100,
  bob: 92,
  chris: 95,
  dave: 97
  }

  grades.select { |name, grade| grade <  97 }
  # ==> { :bob => 92, :chris => 95 }

  grades.select { |k, v| k == :alice }
  # ==> { :alice => 100 }
  ```

- `.each_key` and `.each_value` methods

#### Ruby Symbols

- firstly, Ruby checks the `object_id` to check for equality. **Two symbols of the same name are the same object**.

  - meanwhile the same string in different places will be a different "object" with different `object_id`

- uses of symbols:

  - _they make good hash keys and for referencing method names_ because:
    - immutable
    - only one copy of any symbol exists at any time, so they save memory
    - symbol-as-keys are faster than strings-as-keys for lookups

- .`to_s` and `.to_sym` exist **OR** use `.intern`(internalize)

  ```ruby
  strings = ["HTML", "CSS", "JavaScript", "Python", "Ruby"]
  symbols = []
  strings.each {|s|
      symbols.push(s.to_sym)
  }
  ```

- old code uses hash rockets `:one => 1` but now, it's `one: 1`

#### Methods

- just put parentheses for params
- **splat arguements**: the method can receive one or more arguments
- Blocks are nameless methods. Since they aren't named, they can't be called repeatedly

- `.sort` is just pretty nifty. Sort ordering can be done using an optional param:

  ```ruby
   # sorts ascending
   books.sort! { |firstBook, secondBook| firstBook <=> secondBook }
   # sorts descending
   books.sort! { |firstBook, secondBook| secondBook <=> firstBook }
  ```

- **_combined comparison operator_**: to compare two Ruby objects: `<=>`

  - returns `0` if the first operand equals second and
  - `1` if the first operand is greater than second and
  - `-1` if first operand is less than second.

- blocks considered as objects too

- `collect`: a non-destructive version of mapping onto an array

#### Ruby Specialties

- one-liner if

  ```ruby
    if condition
    # Do something!
    end
    # equivalent expression:
    expression if boolean
  ```

- one liner unless
- ternary operator: **_note: don't add in extra indentation! it will break the code_**
- case statements are `when`-`then` statements

  ```ruby
  case language
  when "JS"
      puts "Websites!"
  when "Python"
      puts "Science!"
  when "Ruby"
      puts "Web apps!"
  else
      puts "I don't know!"
  end
  ```

- `yield` (don't really understand this yet)

- **_Conditional Assignment_**: `||=` assigns a variable only if it hasn't been assigned
- `.upto()` and `.downto()`

  - e.g. `"L".upto("P"){|x| puts x}`

- _symbols, see if an object can receive a method:_ `.respond_to?()`. Bool return value

  - e.g. `[1, 2, 3].respond_to?(:push)` returns `true`
  - _nb: realise that the method name is referred to using a symbol. Every method will have a symbol referring to that method._

- Ruby shovel/concatenation operator `<<` to push things into an array(works on strings too).

  - can use this for concatenation like so:
    - `"I am " << age.to_s << " years old."`

-

#### Ruby Procs

- ```ruby
   cube = Proc.new { |x| x ** 3 }
   [1, 2, 3].collect!(&cube)
   # ==> [1, 8, 27]
   [4, 5, 6].map!(&cube)
   # ==> [64, 125, 216]
  ```

  - the `&` is needed to covert the proc into a block for methods that accept blocks only, hereit's the collect and map methods
  - can call the proc using `.call`

-`&` can be used to convert symbols to procs

```ruby
strings = ["1", "2", "3"]
nums = strings.map(&:to_i)
# ==> [1, 2, 3]
```

#### Ruby Lambdas

- syntax: `lambda { |param| block }`
- procs vs lambdas:
  - First, a lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.
  - Second, when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.

### Basic OOP Concepts

- _Classes_ can be instantiated into _Objects_ that have _methods_(functions) and _attributes_(data)
- **Instance Variable** : variables that belongs to the instance of a particular class
- **Scope**: global variable: `$`>> class variable: `@@` >> instance: `@` >> local

  - note: if you're using one of the syntaxes: like `$`, the entire variable name includes `$`, so you'll have to include that whenever you're referring to that particular variable

  - protip: you can use class varibles to keep class-level counters, e.g. the number of instances of the class that you've had so far

- **_Inheritance_**

  - **override**: replacing an inherited version of any object that is an instance of the subclass
    no need for any other keywords, just redefine the method of the same name in the child class
  - **super** : when you want to explicitly call the method from the superclass.

  - Ruby **_`mixins`_** Ruby doesn't have **multliple-inheritance**: so, any class can only have one superclass

- Scope accessors: separating **private implementation** form **public interface**

  - `public`, `private`
  - note that in a class, everything after `public` until the end of the class becomes public unless otherwise indicated
  - **explicit receivers**: the object from which you can call private methods from is the explicit receiver `object.method` object is the receiver of the method

- `attr_accessor`,`attr_reader`,`attr_writer`, setters and getters

#### **_Modules_**

- pretty much like classes, except they can't create instances and can't have subclasses. Are just used to store things
- purpose:
  - **Namespacing**: Separate methods and constants into named spaces and **Scope Resolution Operator`::`**
    Scope Resolution Operator indicates what
- put constants in them, written in ALL_CAPS

- creating Modules:

  ```ruby
  module ModuleName
    # Bits 'n pieces
  end
  ```

- explicitly `requiring` modules from elsewhere (essentially importing)
- `include` statements are so that you wouldn't have to prepend the module name
  - mixes a module's methods in at the **instance level**(allowing instances of a particular class to use the methods)
- `extend`
  - mixes a module's methods at the **class level**, the class itself can use the methods, as opposed to instances of the class

##### **_Mixins_** : imitating multiple inheritance

- when a module is used to mix additional behaviour and info into a class, it's a mixin
- allows customization of a class
- `include` statements are so that you wouldn't have to prepend the module name
  - mixes a module's methods in at the **instance level**(allowing instances of a particular class to use the methods)
- `extend`
  - mixes a module's methods at the **class level**, the class itself can use the methods, as opposed to instances of the class

### [Time class](https://www.tutorialspoint.com/ruby/ruby_date_time.htm)

## [Regex](https://regexone.com/)

- everything is essentially a character: our job is to write patters to match a specific string
- can be normal ASCII or unicode
- the search happens anywhere on the string, not necessarily just from the beginning of the string

### **Metacharacters**

- `\d` use in place of any digit from 0 to 9. Like a placeholder the `\` is to distinguish it as a **metacharacter**
- `.` is a **wildcard**, can match any single character
  - so to match the period character, put an escape char like so:`\.`
- _including specific characters only:_ `[abc]` will match only a **single** a or b or c and nothing else

- _excluding specific characters_: `[^abc]`

- **character ranges** `[0-6]` in sequential range
- `\w`: **_alphanumeric metacharacter_**: equlivalent to `[A-Za-z0-9_]`
- Character repetitions: `{}`
  - `[wxy]{5}` (five characters, each of which can be a w, x, or y)
  - `.{2,6}`(between two and six of any character)
  - Quantifiers:
    - **Kleene Plus and Kleene Star**:
      - \d\* to match any number of digits
      - \d+ which ensures that the input string has at least one digit.
      - [abc]+ (one or more of any a, b, or c character)
      - .\* (zero or more of any character).
    - **optionality** :
      - `b?c` will match either the strings "abc" or "ac" because the b is considered optional.
      - as usual, have to use escape character when searching for the character "?"
- Whitespace Characters: space (␣), the tab (\t), the new line (\n) and the carriage return (\r)

  - `\s`: any kind of whitespace

- Starting and Ending:

  - `^success` : string starts with success only
  - `$sucess`: string ends with success

- Capture Group: `()` <-- whatever inside is what you want to capture
  -**nested groups??**

- **conditionals***: `|`