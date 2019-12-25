# [Ruby In Depth](https://www.theodinproject.com/courses/ruby-programming/lessons/how-this-course-will-work-ruby-programming)

- [RUBY STYLEGUIDE](https://github.com/rubocop-hq/ruby-style-guide)
- [TODO: watch this 40 min vid on OOP concepts](https://vimeo.com/91672848)
- [Standard, Useful Ruby Libraries](http://rubydoc.info/stdlib)

- I'm spending too long on writing notes, so this time I'll not be doing any explanations. Will spam links and write short phrases that hopefully are succinct.
- **_none of the additional resources/ majority of the tutorials aren't exactly done properly. do again if the need arises_**

### Aims:

- Ruby ability to be able to debug problems when using frameworks
- OOP concepts
- I chose to follow the longer path instead of zooming through. Should be done in 5 days or so I hope

### TODOS:
 
- [TODO: watch this 40 min vid on OOP concepts](https://vimeo.com/91672848)
- Skipped the [hangman tutorial for FileIO and serialisation](https://www.theodinproject.com/courses/ruby-programming/lessons/file-i-o-and-serialization?ref=lnav#assignment)
- 

### Resources:

**_Contents:_**

- [Ruby In Depth](#ruby-in-depth)
    - [Aims:](#aims)
    - [TODOS:](#todos)
    - [Resources:](#resources)
  - [Ruby Building Blocks](#ruby-building-blocks)
    - [Basic Syntax](#basic-syntax)
      - [Ruby Equality](#ruby-equality)
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
- [or use block notation:](#or-use-block-notation)
- [NB: The file handle is automatically closed at the end of the block, so no need to call the close method](#nb-the-file-handle-is-automatically-closed-at-the-end-of-the-block-so-no-need-to-call-the-close-method)
- [to_yaml method: making a Ruby hash and turning it into a YAML string using modules provided by the standard library](#toyaml-method-making-a-ruby-hash-and-turning-it-into-a-yaml-string-using-modules-provided-by-the-standard-library)
- [from_yaml: take the string, convert it into a Ruby hash, then use the contents of our hash with the constructor to construct a new instance of Person.](#fromyaml-take-the-string-convert-it-into-a-ruby-hash-then-use-the-contents-of-our-hash-with-the-constructor-to-construct-a-new-instance-of-person)
  - [EventManager Tutorial](#eventmanager-tutorial)

## Ruby Building Blocks

- Codeacademy Tutorial for syntax revision

### Basic Syntax

- `print` simply prints, no new line at the end of your printing, `puts` will add a new line
- `unless` statements in Ruby: doesn't give you infinite recursion!!
- `gsub`: can't put spaces b/w the `gsub` and the parentheses

#### Ruby Equality

- `=` for assignment
- `==` for equality two things are equal but don't have to be identical instances.
- `===` asks whether the thing on the right is a member or a part or a type of the thing on the left.
  - `(1..4) === 3` returns `true`
  - also can be used to check if something is an instance of a particular class:
    - `Integer === 3 # returns true`

#### Loops and Iterators:

- `loop` will invode an infinite loop, then you can keep doing until some specified `break` condition is met

- `until` loop, like a backward while loop
- **_there is no `++` in Ruby_** but the `+=` shortforms still exist

* inclusive range: `for num 1..10` exclusive range: `for num 1...10`

* curly braces are _generally_ interchangable with `do` and `end` keywords

* controlling iterations using `break`, `next` and `continue`

#### Array Methods

- `.each` iterator for arrays : the placeholder param within `||`
- `.times` iterator
- check union of two arrays: `&`
- push and pop are desctructive methods
- `delete_at(<idx>)` exists
- you can essentially build an array like so:
  - `Array.new(5){|item_index| item_index ** 2}` an optional arg of a block can be used

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
- **Option Hashes**

  - usually your methods are defined like so: `def method_name arg1, arg2, arg3, options_hash`
    - if a hash is the last argument that is being called, then you can skip the curly braces
      `link_to "click here!", "http://www.example.com", :id => "my-special-link", :class => "clickable_link"`
      the `:id` and `:class` are optional stuff that is being added to the options hash

- `merge` method for hashes, right hash will override the left if there are any conflicts

- **Sets** are hashes where the values are just true/false values. Hashes are faster than arrays, so good idea to store bool flags like so.

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

- Predicate methods are called **_reflection methods_**

  - e.g. `1.is_a?Integer` or `1::class` <--- both tell you what object it is
  - can use `::superclass` to ask what a particular class what its parent is

- **Method side-effects**
-

* just put parentheses for params for readability
* **splat arguements**: the method can receive one or more arguments
* Blocks are nameless methods. Since they aren't named, they can't be called repeatedly

  - one liner blocks can use curly brace. multi-line blocks you **have to** use `do...end`

* `.sort` is just pretty nifty. Sort ordering can be done using an optional param:

  ```ruby
   # sorts ascending
   books.sort! { |firstBook, secondBook| firstBook <=> secondBook }
   # sorts descending
   books.sort! { |firstBook, secondBook| secondBook <=> firstBook }
  ```

* **_combined comparison operator_**: to compare two Ruby objects: `<=>`

  - returns `0` if the first operand equals second and
  - `1` if the first operand is greater than second and
  - `-1` if first operand is less than second.

* blocks considered as objects too

* `collect`: a non-destructive version of mapping onto an array

#### Ruby Specialties

- **parallel assignment**:

  ```ruby
  > a, b = 1, "hi"
  => [1, "hi"]      # ignore this output
  > a
  => 1
  > b
  => "hi"
  > my_array = [1,2,3,4]
  => [1,2,3,4]
  > my_array[1], my_array[3] = 100, 200
  => [100,200]      # ignore
  > my_array
  => [1,100,3,200]
  ```

  **_very useful for swapping things_**:`a,b = b,a`

- one-liner if, the order doesn't matter

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
- An example of how `each` method utilizes `yield` under the hood

  ```ruby
  class Array
    def my_each
      i = 0
      while i < self.size
          yield(self[i])
          i+=1
      end
      self
    end
  end
  ```

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

- a block is actually a Proc

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

- blocks and procs are both types of **_closures_**: chunk of code that you can pass around but which hangs onto the variables that you gave it when you first called it

#### Ruby Lambdas

- syntax: `lambda { |param| block }`
- procs vs lambdas:

  - First, a lambda checks the number of arguments passed to it, while a proc does not. This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.
  - Second, when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.

- if you use `return` inside a block or proc, then you'll return control from the entire method, but using lambdas, you can return from the lambda only

### [Time class](https://www.tutorialspoint.com/ruby/ruby_date_time.htm)

- current time: `Time.now` or instantiate like so: `Time.new`
- `strftime`: control time formatting

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

- Capture Group: `()` <-- whatever inside is what you want to capture -**nested groups??**

- **conditionals\***: `|`

## Ruby Enumerable Methods [Documentation Here](https://ruby-doc.org/core-2.0.0/Enumerable.html)

- actually all are from a module called `Enumerable`
- `each` is for Arrays, Hashes and Range classes
- `each_with_index`:

  ```ruby
  > ["Cool", "chicken!", "beans!", "beef!"].each_with_index do |item, index|
  >   print "#{item} " if index%2==0
  > end
  Cool beans! => ["Cool", "chicken!", "beans!", "beef!"]
  ```

- `select` basically filter
- `map` and `collect` mean the exact same thing, no difference
- `any?`
- `all?`
- `none?`
- `find`
- `group_by`
- `grep`

## [Basic OOP Concepts](https://launchschool.com/books/oo_ruby/read/inheritance)

- OOP paradigm is useful to handle large software systems
- Another benefit of creating objects is that they allow the programmer to think on a new level of abstraction. Objects are represented as real-world nouns and can be given methods that describe the behavior the programmer is trying to represent.

  **Encapsulation**:

  - controlling access to various pieces of functionality to different parts of the code

  **Polymorphism** :

  - gives us flexibility in using pre-written code for new purposes
  - Using modules: Modules are similar to classes in that they contain shared behavior
    - A module must be mixed in with a class using the include method invocation. This is called a **mixin**. After mixing in a module, the **behaviors** declared in that module are available to the class and its objects.

- use `.ancestors` to analyse the **method lookup chain**. Useful when using mixins and class inheritance

- Classes* can be instantiated into \_Objects* that have _methods_(functions) and _attributes_(data)

### Scope

- global variable: `$`>> class variable: `@@` >> instance: `@` >> local

#### Initializing

- the `initiallize` method gets called everytime you create a new object using `new` keyword

* when calling, call the getter method for a particular instance variable instead of calling the instance variable directly (better style)

* note: if you're using one of the syntaxes: like `$`, the entire variable name includes `$`, so you'll have to include that whenever you're referring to that particular variable

* protip: you can use class varibles to keep class-level counters, e.g. the number of instances of the class that you've had so far

* `attr_accessor`,`attr_reader`,`attr_writer`, setters and getters

  - realise that the way we write setters and getters are just conventions (e.g. `name=` and `name`)
  - `attr_accessor` adds states as _symbols_: `attr_accessor :name, :height, :weight`
  - **you can keep an abstract function that does changing and displaying of states in one line!**
    - e.g. a `change_info` and `info` method.

* the `self`: tells ruby that we are calling the setter method and not creatinga local variable:

  ```ruby
  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end
  ```

#### Class Methods

- methods that we can call directly on the class itself, without having to instantiate any object.
- put functionality that does not pertain to individual objects. Objects contain state, and if we have a method that does not need to deal with states, then we can just use a class method

- two good times to use class methods:

  1. **_factory method_**: when you're building new instances of a class that have a bunch of known or "preset" features
  2. when you have some sort of utility method that should be identical across all instances and won't need to directly access instance variables.

- **_we *prepend* the method name with `self.`_**

  ```ruby
    def self.what_am_i         # Class method definition
      "I'm a GoodDog class!"
    end
  ```

  - two clear uses of `self` **_both imply different contexts_**:

    1. `self`, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=`is the same as `sparky.weight=`, in our example.
    2. `self`, outside of an instance method, references the class and can be used to define class methods. Therefore, `def self.name=(n)` is the same as `def GoodDog.name=(n)`, in our example.

    so when you call `self` from within a method, it returns the **calling object** so, `self.name=` is the same as `sparky.name`

- **Class Variables: `@@name`**

- note that if you puts an object, you get it's object ID, so if you want to override the `to_s` that puts calls under the hood, you have to declare it in the class
- call `p` if you just want to inspect.

### **_Inheritance_**

- **override**: replacing an inherited version of any object that is an instance of the subclass
  no need for any other keywords, just redefine the method of the same name in the child class

- **super** : when you want to explicitly call the method from the superclass.

  ```ruby
    class Animal
      def speak
        "Hello!"
      end
    end

    class GoodDog < Animal
      def speak
        super + " from GoodDog class"
      end
    end

    sparky = GoodDog.new
    sparky.speak        # => "Hello! from GoodDog class"
  ```

  - another common use of `super` is with initialize:

    - `super` **_automatically forwards the arguments_** that were passed to the method from which `super` is called (if unspecified)

      ```ruby
        class Animal
          attr_accessor :name

          def initialize(name)
            @name = name
          end
        end

        class GoodDog < Animal
          def initialize(color)
            super
            @color = color
          end
        end
        class BadDog < Animal
        def initialize(age, name)
            super(name)
            @age = age
          end
        end

        BadDog.new(2, "bear")

        bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
      ```

- Ruby **mixins** Ruby doesn't have **multliple-inheritance**: so, any class can only have one superclass

- Scope accessors: separating **private implementation** form **public interface**

  - `public`, `private`
  - note that in a class, everything after `public` until the end of the class becomes public unless otherwise indicated
  - **explicit receivers**: the object from which you can call private methods from is the explicit receiver `object.method` object is the receiver of the method

### **_Modules_**

- pretty much like classes, except they can't create instances and can't have subclasses. Are just used to store things
- purpose:

  1. **Namespacing**:

  - Organising similar classes under a module; using modules to group related classes
  - Separate methods and constants into named spaces
    - **Scope Resolution Operator`::`** : call classes in a module by appending the class name to the module name
      Scope Resolution Operator indicates what

  2.  put constants in them, written in ALL_CAPS
  3.  Modules as a **container** for methods, module methods.
      - calling them:
        - `value = Mammal.some_out_of_place_method(4)` <== preferred way
        - `value = Mammal::some_out_of_place_method(4)`

- creating Modules:

  ```ruby
  module ModuleName
    # Bits 'n pieces
  end
  ```

-Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling. You can see this convention with our `Swimmable` module. Likewise, we could name a module that describes "walking" as `Walkable`.

- explicitly `requiring` modules from elsewhere (essentially importing)
- `include` statements are so that you wouldn't have to prepend the module name
  - mixes a module's methods in at the **instance level**(allowing instances of a particular class to use the methods)
- `extend`
  - mixes a module's methods at the **class level**, the class itself can use the methods, as opposed to instances of the class

#### **_Mixins_** : imitating multiple inheritance

- when a module is used to mix additional behaviour and info into a class, it's a mixin
- allows customization of a class
- `include` statements are so that you wouldn't have to prepend the module name
  - mixes a module's methods in at the **instance level**(allowing instances of a particular class to use the methods)
- `extend`
  - mixes a module's methods at the **class level**, the class itself can use the methods, as opposed to instances of the class

### **_Privacy:_** Private, Public and Protected

- note that if your class method is private, you can only call it within the class (e.g. by other class methods). When you're calling the variable, you don't need to prepend `self.`
- You should change the default thought in your head from "everything is accessible, what do I need to hide?" to "everything should be hidden, what do I absolutely need to make externally available?"
- Protected:

  - from inside the class, protected methods are accessible just like public methods. we can call a protected method from within the class, even with self prepended

    ```ruby
    class Animal
      def a_public_method
        "Will this work? " + self.a_protected_method
      end

      protected

      def a_protected_method
        "Yes, I'm protected!"
      end
    end

    fido = Animal.new
    fido.a_public_method        # => Will this work? Yes, I'm protected!
    ```

  - from outside the class, protected methods act just like private methods. we can't call protected methods from outside of the class.

    ```ruby
    fido.a_protected_method
    # => NoMethodError: protected method `a_protected_method' called for
    #<Animal:0x007fb174157110>
    ```

## Errors

### Exception Handling

- `begin/rescue` block: on code where you anticipate errors

  - you can run some code if it throws error, and also allows the code to continue on

  ```ruby
  a = 10
  b = "42"

  begin
    a + b
  rescue
    puts "Could not add variables a (#{a.class}) and b (#{b.class})"
  else
    puts "a + b is #{a + b}"
  end
  ```

- using `retry`: edirects the program back to the begin statement.

## Files and Serialization

- Files: collections of bits and bytes
- need to be able to open, read into program, modify, save
- remember that the files are just a long stream of words/characters/bytes being read in from top to bottom
  - to do more detailed stuff like write to a specific point in a file, need to figure out what position you’re at first, since you may be in the middle of it somewhere.
- **Serialisation:** converting your data into a storable format like a string
  - useful whether you’re thinking of saving your objects and classes (say, when you’re in the middle of a game) to a file
  - or when you’re transmitting those same types of objects to the web browser (since the only way for information to travel via HTTP is as a string)
- Common Serialisation formats:
  - YAML: used mainly to save config files in Ruby on Rails (because lightweight and easily readable)
  - JSON: ubiquitous across the web, the format of choice to deliver complex or deeply nested data (like objects) from some website to your program via an API (like if you want to interface with Google Maps).
- Overlaps b/w files, serialization and databases: maintaining state and permanence of your data

### Ruby IO Class

- `IO` objects wrap IO streams w
  - consts `STDIN`, `STDOUT`, `STDERR` that point to the default streams
  - global vars `$stdin`, `$stdout` `$stderr` point to the consts
    - can overwrite globals to point to deifferent I/O streams
- to create a new IO object, we need a file-descriptor (0, 1 or 2 for stdin stdout stderr or make one)
- then, we can do reading or writing..
- finally, close the stream to flush Ruby's buffer and release the file descriptor back to the OS.

  ```ruby
  fd = IO.new(1) # for choosing the standard IO streams
  io.puts "hello"

  fd = IO.sysopen("/dev/null",'w+') # if it's some other IO stream w/o file descriptors: fd = IO.sysopen("<filepath>",'<mode>')
  dev_null = IO.new(fd)
  dev_null.puts 'hello'
  dev_null.close

  ````

#### Position

- there's a "cursor" of sorts,
- can see what line you're in by calling: `<fd>.pos`
- can check if end of file: `<fd>.eof?`
- can go back to the beginning of the stream, calling: `<fd>.rewind`
- if you're aldy at EOF, you'll get IO errors.
- after writing, rewind first, then you can do the reading, or you'll be at the end of the file and won't be able to read anything
- any write operations in the middle of the stream will overwrite existing data
- streams don't get loaded into memory, literally line by line
- would be expensive to load into memory at all times
- also, streams can be infinite

#### Subclass: File

- allows read/write w/o having us bothering with file descriptors.
- gives some convenience methods like size, chmod and path
  
- ***basic file creation***:
   
  ```ruby
  somefile = File.open("sample.txt", "w")
  somefile.puts "Hello file!"
  somefile.close   

  # or use block notation:
  # NB: The file handle is automatically closed at the end of the block, so no need to call the close method
  File.open("sample.txt", "w"){ |somefile| somefile.puts "Hello file!"}

  ```

  - note, using "w" as opening mode will *overwrite the existing contents* of a file, use "a" instead for append


- ***basic reading from a file***:
  - just open using "r" 
  - everytime you open your current pos is based off of the prev read position

  ``` ruby
  contents = File.open("sample.txt", "r"){ |file| file.read }
  puts contents
  ```

  - for delimited files (e.g. csv), better to read line by line
  
    - `readlines` method can draw in all the content and **automatically parse it as an array**, splitting the file contents by the line breaks.
      - may not be a good idea when you file size is huge (taxes your computer), hence `readline` is more efficient

      ```ruby
      File.open("sample.txt").readlines.each do |line|
        puts line
      end
      ```

    - `readline` method reads singular line, usually used with an `while` or unless `block`:
      
      ```ruby
      file = File.open("sample.txt", 'r')
      while !file.eof?
        line = file.readline
        puts line
      end
      ```

- ***closing a file is important***


- see the `Dir` class for more magic


#### Subclass: Sockets
- `TCPSocket`
- `UDPSocket`
- `UNIXSocket`
- `Socket`

#### Subclass: StringIO

- strings behaving like IOs, when we want to pass strings into systems that consume streams
- `StringIO` **does not** inherit from `IO`
- e.g of use: we can inject a StringIO instead of reading an actual file from disk

#### Subclass: Tempfile
- doesn't inherit from IO, implements  `File`'s interface, dealing with temp files
- can be passsed to any object that consumes IO-like objects


### Serialization: Parsing into Strings

- Serialization takes a Ruby object and converts it into a string of bytes and vice versa

#### YAML: YAML aint markup language

- pretty readable when you want to convert from ruby.. see [Testfile here](/serialization_examples/test.yaml)
- here's how you write the ruby code for serialisation and deserialisation:

  ``` ruby
  class Person
    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
      @name = name
      @age = age
      @gender = gender
    end
  # to_yaml method: making a Ruby hash and turning it into a YAML string using modules provided by the standard library
    def to_yaml
      YAML.dump ({
        :name => @name,
        :age => @age,
        :gender => @gender
      })
    end
  # from_yaml: take the string, convert it into a Ruby hash, then use the contents of our hash with the constructor to construct a new instance of Person.
    def self.from_yaml(string)
      data = YAML.load string
      p data
      self.new(data[:name], data[:age], data[:gender])
    end
    # literally the same, except for the use of JSON, instead of YAML
    def to_json
        JSON.dump ({
        :name => @name,
        :age => @age,
        :gender => @gender
        })
    end

    def self.from_json(string)
        data = JSON.load string
        self.new(data['name'], data['age'], data['gender'])
    end



    # MessagePack!
    def to_msgpack
    MessagePack.dump ({
        :name => @name,
        :age => @age,
        :gender => @gender
      })
    end

    def self.from_msgpack(string)
      data = MessagePack.load string
      self.new(data['name'], data['age'], data['gender'])
    end
    
    p = Person.new "David", 28, "male"
    p p.to_yaml

    p = Person.from_yaml(p.to_yaml)
    puts "Name #{p.name}"
    puts "Age #{p.age}"
    puts "Gender #{p.gender}"
  end
  ````

#### JSON: Javascript Object Notation

- just draws its roots from JavaScript.
- The syntax for JSON is nearly the same as the syntax for defining Javascript objects (which are somewhat analogous to Ruby hashes)
  (see code block above)

- Json syntax is sim to Ruby and Javascript, so it's easy to just use that
- pretty much used everywhere in browsers
- doesn't need an extra library, like YAML does
- If primary objective ofr a serialization method is to communicate w Javascript, look at JSON first

#### MessagePack: binary format, space saving and fast

- need to install hte msgpack gem first

#### Modularize w Mixins

- similar serialization/unserialization methods, so just create mixin:

  ```ruby
  require 'json'

  #mixin
  module BasicSerializable

    #should point to a class; change to a different
    #class (e.g. MessagePack, JSON, YAML) to get a different
    #serialization
    @@serializer = JSON

    #================SERIALIZE========================
    def serialize
      obj = {}

      # loops ovr instance_variables,
      #   constructing a Ruby hash of var names and values
      instance_variables.map do |var|
        obj[var] = instance_variable_get(var)
      end

      # use @@serializer to dump out the object
      #   if no dump method, can just subclass a dump method
      @@serializer.dump obj
    end

    #================UNSERIALIZE========================

    # use the serializer to get a Ruby hash out of the string and set the object’s instance variables to the values of the hash
    def unserialize(string)
      obj = @@serializer.parse(string)
      obj.keys.each do |key|
        instance_variable_set(key, obj[key])
      end
    end
  end
  ```

  Now, it's easy to implement the `Person` class:

  ```ruby
  class Person
  include BasicSerializable

    attr_accessor :name, :age, :gender

    def initialize(name, age, gender)
      @name = name
      @age = age
      @gender = gender
    end
  end

  ```



  - ***NB:*** it will fail for an object that has other BasicSerializable objects as instances, see [this link for the workaround](https://www.sitepoint.com/choosing-right-serialization-format/)


## EventManager Tutorial

- Our goal is to get in contact with our event attendees. It is not to define a CSV parser. This is often a hard concept to let go of when initially solving a problem with programming. An important rule to abide by while building software is:
  - **Look for a Solution before Building a Solution**

- ITERATION 1: using the cs library (a parser)
  - just use the `CSV.open` instead of  `read` or `readlines`. 
  - `headers:` param can be given, to indicate if there are headers or not
  - can access row's values using the headers. CSV lib allows us to convert the header names to symbols by adding this param: `header_converters: :symbol` 
    - all the symbols are lowercase, same char though but lowercase, so header "Zipcode" becomes `:zipcode`

  - still need to do some data handling though, based on the data types of the csv file entries..

- ITERATION 2: CLEANING UP THE DATA
  - **padding with 0:** zip codes that are 5digits, assume there is a leading 0. If more than 5, truncate to first 5
    - DO THE PADDING WITH   `.rjust`  
  - for missing zipcodes, set default as "00000"

  - must be able to handle empty cells/last line which will be nil, so do a nil check
  - put the logic in a module for good presentation 
  
- doing some cleaning up: 
  - **coercion over questions**: when you make sure all the values will be of the same datatype, so the nil, convert it to a string
  - realise that you don't need to have a separate case to see how many digits the initial zipcode has
  - can just refactor the code to include everything as a one-liner

- ITERATION 3: USING GOOGLE API: CIVIC INFORMATION
    - [Google Civic Information API](https://developers.google.com/civic-information/)
    - see how to analyse a api url
    - install the gem for the google-api-client([documentation](https://github.com/googleapis/google-api-ruby-client))


  - the steps we need to set up and use the google-api-client gem:
      1. set the API key
      2. send query w given criteria
      3. parse the response for the info we want
    explore the data using irb

  - rmb to use the ***Exception Class*** to catch bad data (missing info and such)

  - analyse the output, in this case, make it so that the legislator object doesn't display the *raw* legislator object, we just want to capture the first name and last name of each legislator
      1. iterate over the collection for a particular zipcode
      2. each legislator, find the representative's name
      3. add the name to a new collection of names
  
- ITERATION 4: CREATING FORMS USING ERB TEMPLATES
  - we could have just put a string blob but not nice, so use an ERB template instead
  - use `File.read` to read the template form 
  - erb stuff:
    - `<% %>` : the output of ruby code within this will not be displayed in the form
    - `<%=  %>`: the output of ruby code will be displayed 
  - now, our application needs to do the following:
    - Require the ERB library
    - create the ERB template from the contents of the template file
    - simplify the `legislators_by_zipcode` to return the original array of legislators instead of the nice output that we wanted

  - the **`binding`** method:
    - returns a special object which is an instance of Binding
    - an instance of binding knows all about the current state of variables and methods within the given scope. 

  - save each form letter to a file. file names have to be unique, so in this case we use unique id, the first column or row number
      1. assign an ID for attendee
      2. create output folder
      3. save each form letter to a file based on the id of the attendee