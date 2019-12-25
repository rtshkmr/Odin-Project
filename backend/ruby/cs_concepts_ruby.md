# Basic CS Concepts in Ruby

***contents***
- [Basic CS Concepts in Ruby](#basic-cs-concepts-in-ruby)
  - [todos](#todos)
  - [Recursion](#recursion)
  - [Common Data Structures and Algorithms](#common-data-structures-and-algorithms)
  - [Algorithms](#algorithms)
    - [Complexity](#complexity)
    - [Binary Tree Traversals](#binary-tree-traversals)
      - [Depth First / Level Order Search](#depth-first--level-order-search)
      - [Breadth-first Traversal: pre, post and inorder traversal](#breadth-first-traversal-pre-post-and-inorder-traversal)
  - [Linked List Implementation Project](#linked-list-implementation-project)
    - [Some background on linked lists as a data structure](#some-background-on-linked-lists-as-a-data-structure)
    - [Ruby and Linked Lists](#ruby-and-linked-lists)
      - [Implementing Linked List in Ruby](#implementing-linked-list-in-ruby)

## todos

  - [consider going thru this lecture series on design and analysis of algorithms](https://www.youtube.com/watch?v=u2TwK3fED8A)
  - [khan academy algos course](https://www.khanacademy.org/computing/computer-science/algorithms)

## Recursion

- some examples:
  - use iterations (while-loop iterations) when it's intuitive to use them, over recursion

    ```ruby
    # a vanilla iterative version

    # make some random rocks
    rocks = 30.times.map{rand(200) + 1}
    puts rocks.join(', ')
    max_rock = 0

    rocks.each do |rock|
    max_rock = rock if max_rock < rock
    end

    puts "Heaviest rock is: #{max_rock}"


    #one-liner iterative version using inject:
    puts "Heaviest rock is: #{rocks.inject{|max_rock, rock| max_rock > rock ? max_rock : rock}}"
    # note that inject and reduce are aliases
    ```
  - here's the recursive implementation for the same thing
    ```ruby
      def rock_judger(rocks_arr)    
          if rocks_arr.length <= 2  # the base case
          a = rocks_arr[0]
          b = rocks_arr[-1]
          else
          a = rock_judger(rocks_arr.slice!(0,rocks_arr.length/2))
          b = rock_judger(rocks_arr)
          end    
          
          return a > b ? a : b
      end

      
      rocks = 30.times.map{rand(200) + 1}
      puts rocks.join(', ')
      puts "Heaviest rock is: #{rock_judger(rocks)}"


      # two-liner implementation:
      def rock_judger(r_arr)     
          count = r_arr.length
          a,b =  count <= 2 ? [r_arr[0], r_arr[-1]] : [rock_judger(r_arr.pop(count/2)), rock_judger(r_arr)]
          return a > b ? a : b
      end
    ```
    *pop method to subdivide each array, the original array, pile_of_rocks, is modified at the end. Programmatically, all the lesser rocks have been discarded.* 


  - need to have under-the-hood understanding of the language to be able to judge when to use recursion and all.
    
      array_append (enumeration):

      ```ruby
      def append_i(arr, n)
          n.downto(0){|i| arr << i}
          arr
      end

      def append_r(arr, n)
          return arr if n < 0
          arr << n
          append(arr, n - 1)
      end

      def reverse_append(arr, n)
          if n < 0
              return arr
          else 
              reverse_append(arr, n - 1) << n
          end

          #  alternative:
          #----------------------------
          # return arr if n < 0
          # reverse_append(arr, n - 1)
          # arr << n
          # arr 
      end






      # Roman numerals: from decimal to roman numerals 
      roman_mapping = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
      }
      def integer_to_roman(roman_mapping, number, result = "")
        return result if number == 0
        roman_mapping.keys.each do |divisor|
            quotient, modulus = number.divmod(divisor)
            result << roman_mapping[divisor] * quotient
            return integer_to_roman(roman_mapping, modulus, result) if quotient > 0
        end 
      end


      #Roman numerals: from roman numerals to decimal:
      roman_mapping = {
        "M" => 1000,
        "CM" => 900,
        "D" => 500,
        "CD" => 400,
        "C" => 100,
        "XC" => 90,
        "L" => 50,
        "XL" => 40,
        "X" => 10,
        "IX" => 9,
        "V" => 5,
        "IV" => 4,
        "I" => 1
        }

        def roman_to_integer(roman_mapping, str, result = 0)
            return result if str.empty?
            roman_mapping.keys.each do |roman|
                if str.start_with?(roman)
                result += roman_mapping[roman]
                str = str.slice(roman.length, str.length)
                return roman_to_integer(roman_mapping, str, result)
                end
            end
        end


        # recursive fibs, array accumulate:
        # recursive:
        def fibs_r(n, result = [0, 1])
            return result if n < 2
            result << result[-1] + result[-2]
            fibs_r(n - 1, result)
        end
      ```

- [Divide & Conquer: Implementation Issues](https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm#Implementation_issues)
  - if implemented as recursive procedures, the deferred ops are stored in the **procedure call stack**
  - can be implemented by non-recursive programs such as stacks, queues and priority queues can be used to implement. more control over how the recursion happens...
  - stack-size and stack overflow
    - time-efficient algos often have relatively small **recurison depth**. Stack overflow may be difficult to avoid (depends on the compiler)
    - the risk of stack overflow can be reduced by minimizing the parameters and internal variables of the recursive procedure or by using an explicit stack structure.
  - Choice of Base cases:
    - it's simpler to implement recursive programs with the smallest base cases
    - for better efficiency, consider **hybrid algorithms**, specifically **arms-length-recursion**
      - basically, when you use larger base-cases, you get to save on some of the do-nothing overheads
  - Repetitive Recursion on the same cases is a waste of time, better to **memoize**



## Common Data Structures and Algorithms

- data structure: *a data structure is a collection of data values, the relationships among them, and the functions or operations that can be applied to the data*
- purpose: efficient access and modification
- consider these **tradeoffs** when thinking of a few data structures:
  - first population of the data structure
  - time taken to add/find elements
  - memory use 
- these data structures are when arrays, hashes and sets aren't enough

- focus should be on **understanding how the algorithmic problems have been solved in the past**

- examples of data structures and uses: 
  - array
  - linked list
  - record
  - union
  - tagged union/variant
  - object 
  - graphs and binary trees
  - relational dbs use **B-trees** 
  - compiler implementations use **hash tables**


## Algorithms

> "Perhaps the most important principle for the good algorithm designer is to refuse to be content" - Aho, Hopcroft, and Ullman, _The Design and Analysis of Computer Algorithms_, 1974

- keep asking "can we do better?"
- [intro video on algo design](https://www.youtube.com/watch?v=u2TwK3fED8A)
  - things discussed: 
    - how to suggest an improvement to an existing algo
    - Karatsuba Multiplication
    - figuring out how to analyse algos non-trivially

- Algorithms are only comparable if they share a common input and output

### Complexity

- using loops usually involves linear complexity
- observing nesting is a good way to intuitively determine complexity



### Binary Tree Traversals

 - Breadth First


 #### Depth First / Level Order Search

- As we visit a node, we an reference or address all of its children in a queue so we can visit them later. such nodes are called  **Discovered Nodes** and their addresses are what is kept in the queue
- As long as the queue has some discovered node(i.e. it's not empty). we can take out a node from the front, visit it and then enqueue its children.
- Once the queue is empty, the tree has been fully traversed


#### Breadth-first Traversal: pre, post and inorder traversal  

- visiting a node vs visiting a subtree
- the order of visiting root, left and right subtrees and root can be permuted
- basically use a function that takes a pointer/reference to root node as argument and print data in all the nodes in <insert order>
- base case: for any call, if root is null (i.e. it's empty)


## Linked List Implementation Project

### Some background on linked lists as a data structure

- not static, dynamic data structure
- few types of linked lists:
  - singly linked list
  - double linked list : pointers to both next and previous nodes
  - circular linked list : tail points back to the head

-  benefit of a linked list over an  array is that the list elements can easily be inserted or removed **without reallocation of any other elements**.
-  useful for languages where the size of an array is fixed, so to dynamically allocate data, have to use linked lists 
   -  not the case for ruby though
-  linked list structure:
   -  linear collection of nodes that point to the next node using a pointer
   -  each node: single element of a data and a pointer to next node
   -  head node and tail node pointers


### Ruby and Linked Lists

- there's no actual linked list data structure support because the required features exist for arrays!

- you can ***use an array as a linked list***:
  - use array `unshift` to add elements to front, essentially making it a linked list
  - but then using `unshift` would have a performance penalty if you're adding to the ront of the list. 
  - use `<<` or `push` to add to the end of the list 
- Downsides to using array as a linked list: 
  - really slow



- data structures that exclusively use immutable values are known as "functional data structures"
- coolstuff about linked lists: 
  - multiple lists can share the same cells/data values and this **allows us to significantly optimise for space**
  - ruby arrays use the trick called ***"copy on wrtie optimization"***, sharing values across different arrays! this is done by maintaining a single copy of thelarger array with a ll the data values, and creating the second array using a simple pointer to the middle of the larger array


#### Implementing Linked List in Ruby

- can use the `Struct` object or create separate Entry and List Objects..
- 