# Backend Basics

Resources:

- [original documentation for Ruby](http://ruby-doc.com/docs/ProgrammingRuby/)
- [a very extensive Ruby cheatsheet](http://overapi.com/ruby)

I lost the original notes, so this is a sort of rudimentary remake.

## Why Ruby?

- Always runs thru the vm, rubyenv, so you it's guaranteed that the same code will run everywhere, no comparitibility issues

## Ruby Variables

- Ruby evaluates _right-side first_

- Flexible data typing. Also, reassignment of a variable simply overwrites the previous value

- _Ruby has no implicit type conversion!_

  - use methods like `to_s` and `to_i` `to_f` to do type conversions

- Variable naming:

  - Use **snake_case**, w/o special characters
  - Don't have the type of the data within the name, just name based on the meaning of the data

- see variables as **Pointers** to some value. They can point to anything.
  - note that if variables are assigned to another variable, they don't store the pointer, but they point to the same thing as the original variable(pointer)

## Ruby Strings

- shortest possible string is an empty string `""`. If assigned to a variable, an empty sting doesn't return `nil`!

- Strings' char access via zero-indexed numbers.
  - Negative positions exist
  - Can pass in a range:
    `str[0..-1]` will give the range that spans the whole string, hence return the entire string

### Ruby String Methods

- `.length`
- `.split`: default delimiter is a space char `" "`, input argument (the delimiter) is optional
- `.sub` & `.gsub`
- `.reverse` (note this method is not destructive)
- `.upcase` / `.capitalize` (only first **_character_** will be capitalised), `.downcase`, `.swapcase`

- Visual Formatting Methods:
  - `center(<line width>)`
  - `.ljust` & `.rjust`
  ```ruby
  lineWidth = 40
  str = '--> text <--'
  puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)
  # returns:
  # --> text <--                --> text <--
  ```
  - don't expect formatting like a word processor though

### String Combination: Concatenation vs Interpolation

- Interpolation is more powerful as **any expression** within the interpolation syntax will be evaluated:

  ```Ruby
  modifier = "very "
  mood = "excited"
  puts "I am #{modifier * 3 + mood} for today's class!"
  ```

### Ruby Symbols

- two ways to understan Symbols:
  - stripped down strings with limited methods available see `:hello.methods.count` vs `"hello".methods.count`
  - a named integer where it doesn't matter what actual value the symbol references, we just utilise the storing and returning of the same value by the same symbol

## Ruby Numbers

- Ints and floats. See avail methods using `5.methods`

### Ruby Arithmetic

- Power: `**` can use decimal exponents for rooting things

- `.abs` exists

- `rand` : optional argument, defult is b/w 0 (inclusive) and 1 (exclusive). Any input argument scales this to 0(inclusive) and `x`(exclusive)
  `puts('The weatherman said there is a '+rand(101).to_s+'% chance of rain,')`
- **setting seeds**: google it, to get the same randomly generated numbers

### Math Object

- there's a **scope operator** kiv

-

### A Better Loop using the `.times` method

    ```Ruby
    5.times do
    puts "Hello, World!"
    end
    ```

## Ruby Blocks

- can use Bracket Blocks for one-liner blocks

- else, use starting and ending blocks like above w the `do/end` style

  ```Ruby
  5.times do |i|
  puts "Hello, World!"
  end

  "this is a sentence".gsub("e"){|letter| letter.upcase}
    # .gsub used the result of block as a replacement for the match
  ```

### Blocks passed as methods

- many methods accept blocks as parameters e.g. `.gsub`

  ```Ruby
  "this is a sentence".gsub("e"){ puts "Found an E!"}
  Found an E!
  Found an E!
  Found an E!
  => "this is a sntnc"
  ```

## Ruby Arrays

- push to array using the **shovel operator** `<<`

- fetch elements using normal array access

### Array Methods

- [Documentation Page for Ruby Arrays](https://ruby-doc.org/core-2.1.2/Array.html)

- convenient methods like `.last` exist see `[].methods`

- `.sort`:
  - strings sorted lexicographically
  - numbers sorted ascending order
- `index` queries the index of an element

- `.each`

## Ruby Hashes

- Key Value Pairs, two ways to create:

  - names are strings:
    `produce = {"apples" => 3, "oranges" => 1, "carrots" => 12}`
  - names are symbols:
    `produce = {apples: 3, oranges: 1, carrots: 12}`
    take note of the `:` location even though it's a symbol

- Keys are all unique keys, else values of existing key names will be overwriten

- Hash keys sorted via:
  - if numerical string value, then sorted via ascending
    - to force sorting via order of creation, do `"+41"` instead of `"41"`
  - if string value, then sorted via order of creation

## Ruby Conditionals

- syntax:

  ```Ruby
  def water_status(minutes)
    if minutes < 7
        puts "The water is not boiling yet."
    elsif minutes == 7
        puts "It's just barely boiling"
    elsif minutes == 8
        puts "It's boiling!"
    else
        puts "Hot! Hot! Hot!"
    end
  end
  ```

## Objects, Attributes, Methods

- Objects hold info, called **attributes** and perform actions called **methods**

- note the existence of **\*destructive methods** which are called bang methods and whose names end with a `!`
  ```ruby
  name = "Ruby Monstas"
  puts name.downcase! # destructive version
  puts name
  ```

### Classes and Instances

- classes: abstract description of an object, the "blueprint" of sorts

- class naming: always first letter capitalised

- have to be instantiated and assigned to a variable to make sense

```Ruby
class Student
  attr_accessor :first_name, :last_name, :primary_phone_number

  def introduction
    puts "Hi, I'm #{first_name}!"
  end
end
# Instantiate a student object:
frank = Student.new
# Assigning Objects their attributes:
frank.first_name = "Frank"
```

_NB: nil errors are so common. E.g. above, if the attribute of `first_name` isn't set_
_but the `introduction` method is called, there won't be any error!_

- Default return value of a method is _the last line evaluated_

#### Time Class

- `Time` class

  ```Ruby
  time  = Time.new   # The moment I generated this web page.
  time2 = time + 60  # One minute later.
  ```

#### Instance Variables

- using the `@` at the front of variable name, then the variable will last as long as the object does. Normal local variables only last as long as the object does.

```ruby
class Die

  def initialize
    # I'll just roll the die, though we
    # could do something else if we wanted
    # to, like setting the die with 6 showing.
    roll
  end

  def roll
    @numberShowing = 1 + rand(6)
  end

  def showing
    @numberShowing
  end

end
```

so showing will always exist, pointing to the value of die face shown by the last roll (as long as there's a value placed, else you'd get nill)

##### Initializing a Class

see [baby_dragon.rb](./baby_dragon.rb)

To prevent instance variables not having any value to them,
and preventing issues with `nil`, set up using an `initialize` method like above

- note: can put in the instance variable creation within the initialize method

This **initilization** is done upon **instantiation**.

## `puts`, `gets`, `chomp`

- note that under the hood, puts does a type-conversion to string before putting
  that object in your screen. Hence the s in puts, put string..

- `gets` is for user input, `chomp` is to ignore the enter keypress in the input

## Ruby Control Flow

- note that boolean return values aren't returning the strings `"true"/"false"`, they are returning the **objects** `true` / `false`

  ```ruby
  x = 1
  if x > 2
  puts "x is greater than 2"
  elsif x <= 2 and x!=0
  puts "x is 1"
  else
  puts "I can't guess the number"
  end
  ```

- ruby has an **unless** statement

  ```ruby
  x = 1
  unless x>=2
  puts "x is less than 2"
  else
  puts "x is greater than 2"
  end
  ``
  ```

  the `unless`` can be used as a modifier

- ruby case statements:

  ```ruby
  $age =  5
  case $age
  when 0 .. 2
  puts "baby"
  when 3 .. 6
  puts "little child"
  when 7 .. 12
  puts "child"
  when 13 .. 18
  puts "youth"
  else
  puts "adult"
  end
  ```

### Adding Params to Self-Made Methods

```Ruby
def sayMoo numberOfMoos
  puts 'mooooooo...'*numberOfMoos
end
```

note that now you definitely have to supply params to `sayMoo` method

## More on Ruby Classes

- `Time` class

  ```Ruby
  time  = Time.new   # The moment I generated this web page.
  time2 = time + 60  # One minute later.
  ```

## Ruby Blocks and Procs (Procedures)

- Given a block, you can do:

  - wrapping a block up in an object called `proc`
  - store the block in a variable
  - pass it into a method and call that method when we
    desire. Usually methods are bound to an object, but
    doing this allows your method to be an object itself.

  - use the `.call` method to do a proc call

    ```ruby
    doYouLike = Proc.new do |aGoodThing|
       puts 'I *really* like '+aGoodThing+'!'
      end

    doYouLike.call 'chocolate'
    doYouLike.call 'ruby'
    ```

- **Purpose:**

  - since procs are objects but methods are not,
    the usual methods can't do some things that a proc can:

    - you can't pass those methods into other methods
      but procs can be passed into other methods

    - methods can't return other methods but they can
      return other procs
      example of use:

    ```ruby
    def doUntilFalse firstInput, someProc
    input  = firstInput
    output = firstInput

    while output
        input  = output
        output = someProc.call input
    end

    input
    end

    buildArrayOfSquares = Proc.new do |array|
    lastNumber = array.last
    if lastNumber <= 0
        false
    else
        array.pop                         # Take off the last number...
        array.push lastNumber*lastNumber  # ...and replace it with its square...
        array.push lastNumber-1           # ...followed by the next smaller number.
    end
    end

    alwaysFalse = Proc.new do |justIgnoreMe|
    false
    end

    puts doUntilFalse([5], buildArrayOfSquares).inspect
    puts doUntilFalse('I\'m writing this at 3:00 am; someone knock me out!', alwaysFalse)
    ```

    What this method does:
    Our method will take some object and a proc, and will call the proc on that object. If the proc returns false, we quit; otherwise we call the proc with the returned object. We keep doing this until the proc returns false (which it had better do eventually, or the program will crash). The method will return the last non-false value returned by the proc.

    Also note:

    - `.inspect`: the string it returns tries to show you the ruby code for building the object you passed it. Here it shows us the whole array returned by our first call to doUntilFalse.

### Methods that Return Procs

- basically a method that allows composition:

  ```Ruby
  def compose proc1, proc2
  Proc.new do |x|
      proc2.call(proc1.call(x))
  end
  end

  squareIt = Proc.new do |x|
  x * x
  end

  doubleIt = Proc.new do |x|
  x + x
  end

  doubleThenSquare = compose doubleIt, squareIt
  squareThenDouble = compose squareIt, doubleIt

  puts doubleThenSquare.call(5)
  puts squareThenDouble.call(5)
  ```

### Passing Blocks (Not Procs) into Methods

- It's troublesome to do all this:

  1. defining the method
  2. making the `proc`
  3. calling the method with the `proc`

  Ideal way would be:

  1. just define the method
  2. pass the **block** right into the method

  To do this, you have to use the `&` sign like below. n order to make your method not ignore the block, but grab it and turn it into a proc, put the name of the proc at the end of your method's parameter list, preceded by an ampersand (`&`).

  ```ruby
  class Array
      def eachEven(&wasABlock_nowAProc)
          # We start with "true" because arrays start with 0, which is even.
          isEven = true

          self.each do |object|
          if isEven
              wasABlock_nowAProc.call object
          end

          isEven = (not isEven)  # Toggle from even to odd, or odd to even.
          end
      end
      end

      ['apple', 'bad apple', 'cherry', 'durian'].eachEven do |fruit|
      puts 'Yum!  I just love '+fruit+' pies, don\'t you?'
      end

      # Remember, we are getting the even-numbered elements
      # of the array, all of which happen to be odd numbers,
      # just because I like to cause problems like that.
      [1, 2, 3, 4, 5].eachEven do |oddBall|
      puts oddBall.to_s+' is NOT an even number!'
  end
  ```

## Basic Ruby Tutorials (wth, I just looked at answers :') )

## Takeaways from [Odin Project Ruby Tutorials](https://github.com/TheOdinProject/learn_ruby)

- TODO:

  - redo the pig latin exercise
  - learn about regex pls sometime

- for some reason, puts is not just an alternative `return` statement. It will return `nil` :(

- rmb Ruby has no implicit type conversion, so things like `(5/9)` will return `0`.

  - solution:

    - use .to_f
    - or one of them, put in a decimal to make it a float: `5.0/9` or `5/9.0`

- when you want to have variable number of input arguments to a method,
  then you can use a [**_Splat Operator_**](https://alexcastano.com/everything-about-ruby-splats/)

  ```ruby
  def multiply (*inputs)
    res = 1
    inputs.each{|i| res *= i}
    res
  end
  ```

Also see the spec file to see how to make spec files

- passing in **Optional Arguments**:

  - you have to specify both arguments but give a default value for one of them:

  ```ruby
  def repeat(str, repetition=2)
    if repetition == 1
        str
    else
        str + " " + repeat(str, repetition - 1)
    end
  end
  ```

- TODO: 
  - learn how to use regex effectively, see [solutions for piglatin exercise](/home/ritesh/coding/Odin-Project/backend/learn_ruby/04_pig_latin) to see why
  - skipped the timer exercise.

- Ruby [Setters and Getters](https://dev.to/k_penguin_sato/ruby-getters-and-setters-1p30)

  - Getter method is a method that gets the value of an instance variable.
    without it, there's no way to assign value to the instance variable and it can't be gotten.
    It is common practice to name a getter method the instance variable’s name.

  - Defining a setter method inside a class makes it possible to set a
    value of an instance variable outside the class.

  ```ruby
  class Movie
    def initialize(name)
      @name = name
    end

    def name #getter method
      @name
    end

    def name=(name) #setter method
      @name = name
    end
  end

  obj1 = Movie.new('Forrest Gump')
  p obj1.name #=> "Forrest Gump"
  obj1.name = 'Fight Club'
  p obj1.name #=> "Fight Club"


  ```
  - And then accessors:
    - `attr_reader` automatically generates a getter method for each given attribute.

    - `attr_writer`  automatically generates a setter method for each given attribute.

    - `attr_accessor` automatically generates a getter and setter method for each given attribute.
    

- Using the `array.include?(<element>)` to see if an element is within the array
