# The Odin Project JavaScript Fundamentals: my own notes

sources:

- clean code tips:

  - [10 tips to write clean code](https://onextrapixel.com/10-principles-for-keeping-your-programming-code-clean/)
  - [this clean code guidelines wiki is pretty huge](http://wiki.c2.com/?SelfDocumentingCode)
  - [airbnb JavaScript styleguide](https://github.com/airbnb/javascript)

- [w3schools JavaScript tutorials](https://www.w3schools.com/js/)

- [MDN stuff about JavaScript](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/)

- [basic stuff about objects in JavaScript](https://www.w3schools.com/js/js_objects.asp)

extensions:

- [Regex Youtube Tutorials (haven't done them, sometime in the future maybe)](https://www.youtube.com/playlist?list=PL4cUxeGkcC9g6m_6Sld9Q4jzqdqHd2HiD)


-----------

***Table of Contents***
- [The Odin Project JavaScript Fundamentals: my own notes](#the-odin-project-javascript-fundamentals-my-own-notes)
  - [JavaScript Types](#javascript-types)
  - [evaluation rules](#evaluation-rules)
    - [Numbers: the only data type for numbers in JavaScript (other than BigInt)](#numbers-the-only-data-type-for-numbers-in-javascript-other-than-bigint)
    - [NaN : number is not a legal number and Infinity](#nan--number-is-not-a-legal-number-and-infinity)
  - [Operators](#operators)
    - [Logical Operators](#logical-operators)
    - [Binary Operators](#binary-operators)
    - [Assignment Operators](#assignment-operators)
    - [Bitwise and Bitshifting Operators](#bitwise-and-bitshifting-operators)
    - [Comma operator](#comma-operator)
    - [delete operator](#delete-operator)
    - [Equality: structural verses pointer equality](#equality-structural-verses-pointer-equality)
  - [Number Methods and Properties](#number-methods-and-properties)
    - [3 ways to convert Variable to Numbers](#3-ways-to-convert-variable-to-numbers)
  - [Variables in JavaScript](#variables-in-javascript)
  - [Strings](#strings)
    - [String Methods and Properties](#string-methods-and-properties)
  - [Comparators](#comparators)
  - [Conditionals](#conditionals)
  - [JavaScript Functions](#javascript-functions)
    - [Function Scope and Conflicts {CS1101S Environment Model}](#function-scope-and-conflicts-cs1101s-environment-model)
    - [Function Return Values](#function-return-values)
    - [Naming](#naming)
    - [JavaScript labelling (wow)](#javascript-labelling-wow)
    - [Lambda/Arrow Functions [same as CS1101S]](#lambdaarrow-functions-same-as-cs1101s)
  - [Arrays](#arrays)
    - [Array Properties and Methods](#array-properties-and-methods)
  - [JavaScript Loops](#javascript-loops)
  - [Test Driven Development](#test-driven-development)
    - [Higher-Order Functions](#higher-order-functions)
    - [Takeaways from Exercises](#takeaways-from-exercises)
  - [DOM Manipulation](#dom-manipulation)
    - [Selectors: target nodes w them. CSS style selectors an relationship property selectors](#selectors-target-nodes-w-them-css-style-selectors-an-relationship-property-selectors)
    - [DOM Methods](#dom-methods)
      - [Query Selectors: to target nodes](#query-selectors-to-target-nodes)
      - [Element Creation (in memory)](#element-creation-in-memory)
      - [Appending Elements](#appending-elements)
      - [Removing Elements](#removing-elements)
      - [Altering Elements](#altering-elements)
        - [Adding Inline CSS style (not pretty)](#adding-inline-css-style-not-pretty)
        - [Editing Attributes](#editing-attributes)
        - [Working With Classes](#working-with-classes)
      - [Adding text / HTML Content (textContent is better than adding innerHTML)](#adding-text--html-content-textcontent-is-better-than-adding-innerhtml)
  - [DOM Events](#dom-events)
    - [Attaching Function Attributes Directly to HTML](#attaching-function-attributes-directly-to-html)
    - [Attaching Listenters to JavaScript File](#attaching-listenters-to-javascript-file)
    - [Adding event listener to the DOM property](#adding-event-listener-to-the-dom-property)
      - [Adding listeners to groups of nodes](#adding-listeners-to-groups-of-nodes)


-----------


## JavaScript Types

## evaluation rules

- left to right
- Precedence rules, google it.

### Numbers: the only data type for numbers in JavaScript (other than BigInt)

- JavaScript numbers are always 64bit floats
- precision of `int` up to 15 digits
- float error:  
  wrong example: `var x = 0.2 + 0.1; // x will be 30000000000000004`
  trick: `var x = (0.2 * 10 + 0.1 * 10) / 10;`

### `NaN` : number is not a legal number and `Infinity`

- `var x = 100 / "Apple";` yields `NaN`

- any math operation involving `Nan` just yields `Nan`

- `typeof Nan;` returns `"number`

- division of zero returns a signed `Infinity`

- auto interprets hexadecimal if you precede a numerical const with `0x`

- Prevent leading 0s in your numbers to avoid accidentally making interpret interpret as an octal

- change base using `.toString(x)` where x is the base

- you can define a number as an object using the `new` keyword like so:
  `var y = new Number(123);` but it complicates things a lot and slows things down.

## Operators

all operators return a value, even the assignment operator!

### Logical Operators

- not limited to bools! can be done on any type

- `&&` has higher precedence than `||`, `!` has highest precedence of them all

-JavaScript OR `||` is more powerful.

- if operand is not bool, then type conversion to bool happens.
- Use `||` inside an `if` to test for at least one of multiple conditions
- extra feature: **"truthy value"** :
  a chain of OR "||" returns the first truthy value or the last one if no truthy value is found.
- google it for more ingenious uses

- likewise, JavaScript `&&` will return first **falsy** value.

- `&&` operator can replace **if** statements

```javascript
let x = 1;
x > 0 && alert("Greater than zero!");
```

same as this below, but the use of `&&` isn't recommended

```javascript
let x = 1;

if (x > 0) {
  alert("Greater than zero!");
}
```

- you can use a `!!` to typeconvert to bool!, alternatively can use the `Boolean` function.

### Binary Operators

In general, JavaScript implicitly converts type.

- `+` is overloaded operator: both addition and string concatenation but if one of the operands is a string, then the number is converted to a string and concatenated.

- if your strings are purely numeric, then you can directly do numeric operations on them! **NB: works for every binary operator less `+`**. The plus operator will concatenate two numeric strings instead of doing the string operation.

- `**` is exponentiation. `x ** y` produces the same result as `Math.pow(x,y)`

### Assignment Operators

- [Interesting Assignement Operators!](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Expressions_and_Operators#Assignment_operators)

### Bitwise and Bitshifting Operators

???
[see this for more info](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Bitwise_Operators)

### Comma operator

Quite ingenious:

```javascript
var x = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
var a = [x, x, x, x, x];

for (var i = 0, j = 9; i <= j; i++, j--)
  console.log("a[" + i + "][" + j + "]= " + a[i][j]);
```

### delete operator

deletes objects/object property/element in specified array index

successful application of this, returns `undefined`
returns `true` if object can be deleted(if declared implicitly)
returns `false` if can't be deleted, reasons:

### Equality: structural verses pointer equality

- `==` : structural equality. If same number, one an object type and other is a number, then `==` returns true.

- `===`: usual pointer equality

- NB: **_objects can't be compared_** so the following structural equality check returns false:

```javascript
var x = new Number(500);
var y = new Number(500);
x == y;
```

## Number Methods and Properties

- usually, primitives can't have any properties or methods, only objects can. **JavaScript is different**

- properties only work on numbers, won't on variables!

- `toString()` method returns number from literal/variable/exp input
- `toExponential()` method returns string, in standard form (with rounding done if you input significant fig param)
- `toFixed()` returns string, w number written to a specified number of decimals as per input
- `toPrecision()`: return to a certain sig fig
- `valueOf()` returns number as a number. internally used in underlying JavaScript, no reason to actually include in our own code.

### 3 ways to convert Variable to Numbers

these are global methods, not number methods.

- `Number()`
- `parseInt()` : only returns the first int, ignores trailing decimals or spaced out ints, provide the first word can be converted in the first place
- `parseFloat()`

true will have number value of 1 and false will have number value of 0

- if you use `Number()` on a `date` type, then you yield the number of miliseconds since 1.1.1970!

- `alert( +apples + +oranges ); // 5` same as `alert( Number(apples) + Number(oranges) ); // 5` holy hell. This is because **\_unary pluses are applied before binary pluses**

## Variables in JavaScript

- think: storage containers
- 3 ways to create:

  1. var [more on why it's old](https://javascript.info/var)
  2. let
  3. const

- multiple inline/multiline variable declarations are allowed but inadvisable due to readability

- naming: can use `_`and`$` on their own also!

  - legal to use non-english letters but not advisable.

- `const` declarations:

  - difficult to rmb constants, before execution? use allcaps e.g. `COLOUR_RED`
  - _camelCase_ for constants that are not known prior to execution

- an extra variable is good, saves a lot more time not debugging!!

## Strings

- strings are **immutable**

- doesn't matter single or double quotes

- [escaping a char](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#Escape_notation): making sure that the following character after `\` is seen as a text character instead of code character.

- can use `\` to break up long strings for aesthetic purposes in the code view. The same string gets created though, just easier to read. Alternatively, concatenate with `+` to get the same effect.

_String Objects vs Literals_:

- primitives **can** have string object methods working on them!
- different output on calling `eval()`:

```javascript
var s1 = "2 + 2"; // creates a string primitive
var s2 = new String("2 + 2"); // creates a String object
console.log(eval(s1)); // returns the number 4
console.log(eval(s2)); // returns the string "2 + 2"
```

- **NB:** to get the primitive value from string object, use the `valueOf()` method.

### String Methods and Properties

[relevant tutorial](https://www.w3schools.com/js/js_string_methods.asp)

[reference sheet](https://www.w3schools.com/jsref/jsref_obj_string.asp)

- some useful operations on strings:

  - note: can't reverse a string directly! have to split it up first!
  - `length`
  - `+=`
  - Character access (since it's a array of chars)
  - string comparison using usual comparators: `<=`, `>` and so on...
  - to do case insensitive comparison, convert everything to **Uppercase** instead of **lowercase** because of UTF-8 char conversions issues.

- `indexOf()` : returns the index of the position of the first occurrence of a specified text in a string (somewhat like a member function for strings)
- `lastIndexOf()` ^similar
  note that if string not found, then both return `-1` and you can supply starting index as a second parameter to that method.
- `search()` for string in string, returns position
  Search vs indexOf: - search can do regex searches but not indexOf - indexOf can specify starting position but not search

- 3 ways to extract string parts:

  - `slice(start, end)`
    - negative params means start counting from the back
    - omitting the second param means rest of the string will be returned after the start
  - `substring(start, end)` : same as slice, but no negative params
  - `substr(start, length)` : second param is length

- Replacing String content: `replace()`

  - note: regex, if used, is written without quotes
    regex flags:
    `/g`, `/i`

- `trim()` to remove whitespace before and after

- `split()` to convert string to an array, input param is the delimiter of choice

## Comparators

- just treat any comparison with `undefined/null` except string equality with care. Don't use comparatives with a possibly null/undefined. **_Do a null/undefined check before handling them_**

- String comparisons are lexicographical, comparing according to **Unicode Order**. (hence `"a"` > `"A"`)

- JavaScript implicity converts string numerical values and bools to numbers when there's comparison b/w diff types.

- Rmb that equality check will convert values using numeric conversion. Other caveats:

  - regular equality `==` can't differentiate `0` or empty string `""`from `false`.
  - to differentiate `0` from `false`, use strict equality `===`

- comparing with `null` and `undefined`:
  - regular equality returns true, strict equality returns false
  - numerical conversion: -`null` converted to `0` and `undefined` converted to `NaN`
  - strange outputs for

## Conditionals

- `if`,`else`,`else if` `switch`

- `else` block is optional!

- put a `default` case in case the switch expression never returns true.

- multiple ternary operator to give a _series of tests_

- [good use cases for switch statements](https://www.digitalocean.com/community/tutorials/how-to-use-the-switch-statement-in-javascript)

- you can put one case statement for multiple cases!

## JavaScript Functions

- [updated info on Functions, useful to check on default params](https://www.theodinproject.com/courses/web-development-101/lessons/fundamentals-part-3?ref=lnav)

- some built-in functions written in low-level languages like C++, not web languages like JavaScript

- some are defined as part of browser APIs

- function vs method

  - methods are functions that are part of objects.

- anonymous functions: [just stick to the usual way of creating fn]

  - **_generally used along with an event handler_** , e.g.:

  ```javascript
  const myButton = document.querySelector("button");
  myButton.onclick = function() {
    //event handler
    alert("hello");
  };
  ```

  - can assign anonymous as values of a variable.

- parameters:

  - aka arguments/properties/attributes (losely)
  - values passed into function calls are copied to its local variables
  - params: items listed in function declaration, a _placeholder_
  - argument: actual values passed in (for a function call)
  - **function arguments**, when variables are your input params. Any change to the function argument will not change variable in the outer scope! Passing in these arguments creates a local copy within the calling function's scope.
  - if a param is omitted, then its default value is `undefined`.
    We can control the default by doing something like this (new JavaScript feature):

    ```javascript
    function showMessage(from, text = "no text given") {
      alert(from + ": " + text);
    }

    showMessage("Ann"); // Ann: no text given
    ```

    google it to see how to control thedefault param in the old style (just does an input check for undefined)

- **_you'll end up curating your own favourite functions library for the various languages!_**

### Function Scope and Conflicts {CS1101S Environment Model}

- relevant consideration when you're importing script files from diff
  places, you don't want them to have the same scope or else one would override the other for name-conflicts

- `ReferenceError: variable name is not defined`: usually due to function call is done in a scope that is not in the same as the name's scope

- good practice to _minimise the use of global variables in your code_ use it to store **project-level data** instead

### Function Return Values

- `return` without any following expresssion is legal. Just returns `undefined instead`

- `return` keyword and it's value has to be **inline**, can wrap it up with round bracket for better legibility of long lines.

### Naming

- stick to descriptive verbs that describe the purpose of the function: prefix examples:
  - get
  - calc
  - create
  - check
- one function one action, don't do more than one thing within a function

### JavaScript labelling (wow)

### Lambda/Arrow Functions [same as CS1101S]

- multiline arrow functions: just use a curly brace, followed by a `;`
- don't have `this` method

- arrow functions can't be used as constructors, they can't be called with `new` to create new object instances of themselves.

- arrow functions have no "arguments"

- no `super` kiv for later

## Arrays

- arrays are special objects, `typeof` returns `"objects"`. Note that arrays always have numbered indexes while objects have named(including numbered) indexes.
  - use objects when you want element _names_ to be strings and arrays
    when you want element _names_ to be numbers

```javascript
var person = ["John", "Doe", 46]; // an array called person
var person = { firstName: "John", lastName: "Doe", age: 46 }; // an object
```

- two ways to create:
  `var cars = new Array("Saab", "Volvo", "BMW");` [redundant way, avoid]
  or`var cars = ["Saab","Volvo","BMW"];`

- array elements can be of any (and mixed) types, including other objects

### Array Properties and Methods

[array methods reference](https://www.w3schools.com/jsref/jsref_obj_array.asp)

- `length`
- safest way to loop thru an array is via a `for` loops
- `push` (_returns new array length_)and `pop` (_returns the value that was popped out_) [better to use push rather than via index assignment]

- `shift()` and `unshift(<insert valueto index 0>)`

- unlike other languages, **JavaScript doesn't support Hashes (associative arrays with named indexes)**, JavaScript arrays always use numbered indexes.

- 3 ways of identifying if object is an array:

  1. `Array.isArray(fruits); // returns true`
  2. construct yourself: `function isArray(x) { return x.constructor.toString().indexOfArray") > -1;}` returns true _if the object prototype containts the word "Array"_
  3. `fruits instanceof Array; // returns true`

- `splice()` and `concat()` can be used to manipulate array elements without leaving `undefined` holes (unlike `delete()` which leaves undefined holes)

  - **_impt: can use splice to insert and remove elements!!!_**
  - `concat()` can take any number of arguments, returns new arr

- `slice()`: returns new arr obj [see slice vs splice](https://stackoverflow.com/questions/37601282/javascript-array-splice-vs-slice)

- automatic application of `toString()`

## JavaScript Loops

- any part of the for loop statement can be skipped
  - `for(;;){//infiniteloop}`
- conscientiously avoid infinite loops
- `continue` vs `break`

  - **_syntax constructs that aren't expressions can't be used with the ternary operator so things like break/continue aren't allowed within ternary operator_**
  - can label an outer loop and specifically break that like so:

  ```javascript
  outer: for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      let input = prompt(`Value at coords (${i},${j})`, "");

      // if an empty string or canceled, then break out of both loops
      if (!input) break outer; // (*)

      // do something with the value...
    }
  }
  alert("Done!");
  ```

  labelling doesn't allow us to "jump" around arbitrary locations though, only possible from inside a loop, with the label being somewhere above the directive

## Test Driven Development

A productivity hack where you write out test cases first (including how a function call shall be made) and write code until the tests work out properly.

- see the use of spec files and writing out test files!! **_very useful_**

### Higher-Order Functions

- accumulate is called `reduce()` similar to CS1101S, see documentation!

### Takeaways from Exercises

1. Methods applied Left to Right!

also note that strings can't be directly reversed. Have to split first into arr, then reverse then join back.

```javascript
const reverseString = function(str) {
  return str
    .split("")
    .reverse()
    .join("");
};
```

2. Two ways to check if int (some minor diff, go google):
   `Number.isInteger(res)` or `res % 1 === 0`

3. Output numerical string as number:
   `Number(str)` or `(+str)`

## DOM Manipulation

[a reference site called DOM Enlightenment](http://domenlightenment.com/)

- Analogous to a family tree

### Selectors: target nodes w them. CSS style selectors an relationship property selectors

- CSS selectors: ref to the id and class tags you've created in opening tags of your HTML nodes

- Relational Selectors: referring to the "family tree", refer to nodes via selectors like `.firstElementChild`

### DOM Methods

- browser parses HTML code into the DOM. Nodes are therfore objects with many properties and methods
  attached to them. **_JavaScript will alter the DOM, but not the HTML. JavaScript will merely change what the browser renders._**

- for this reason, put all the script tags or JS files at the bottom of the HTML File so that it gets run after the
  DOM nodes are parsed and created, to avoid runtime errors.

#### Query Selectors: to target nodes

- `element.querySelector(selector)` : first match of selector
- `element.querySelectorAll(selectors)`: returns a **_nodelist_** (looks and behaves like an arr but isn't an array)
  nodelist doesn't have all the array methods!
  Can convert a nodelist to an array using [spread operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

#### Element Creation (in memory)

- syntax: `document.createElement(tagName[, options])`
- element created isn't put into the DOM yet. Still can manipulate the element w some logic before putting it in.

#### Appending Elements

- append as a _last_ child to a parent node, syntax: `parentNode.appendChild(childNode)`
- inserting newNode into parentNode, before a `referenceNode`: `parentNode.insertBefore(newNode, referenceNode)`

#### Removing Elements

- remove a child from a parentNode and return reference to the child: `parentNode.removeChild(child)`

#### Altering Elements

As long as there is some reference to an element, we can alter its properties:

##### Adding Inline CSS style (not pretty)

- kebab-cased stuff can't use `-`, use camelcase (just read documentation when required)
  see how to represent a CSS Property as a JavaScript Property

- `<referencename>.style.cssText = "<insert property : value rules >"`

- or, `<referencename>.setAttribute('style', "<css rules>")`

##### Editing Attributes

- `setAttribute()`
- `getAttribute()`
- `removeAttribute()`

##### Working With Classes

- adding a new class to an element,
- removing
- toggling a class (toggling it `active` or removing it)

#### Adding text / HTML Content (textContent is better than adding innerHTML)

- `div.textContent = 'Hello World!'`

- `div.innerHTML = '<span>Hello World!</span>';` renders HTML inside the `div`

## DOM Events

- [list of DOM Events](https://www.w3schools.com/jsref/dom_obj_event.asp)
- events allow dynamic webpages!

- events examples: mouseclicks, keypresses

- 3 ways to make webpage listen and react to events:
  - attach function attibutes directly to HTML
  - set the `"on_event_` property on the **DOM object** in your JavaScript
  - attach **event listeners** to the nodes in your JavaScript [***Preferred method***]

### Attaching Function Attributes Directly to HTML

- problems: only have access to 1 "onclick" event

  ```html
  <button onclick="alert('Hello World')">Click Me</button>
  ```

### Attaching Listenters to JavaScript File

- put the event tag on html file like so:
  `<button id="btn">Click Me</button>`

- then, update the JavaScript file to use the .onClick event listener:

  ```javascript
  // the JavaScript file
  var btn = document.querySelector("#btn");
  btn.onclick = () => alert("Hello World");
  ```

### Adding event listener to the DOM property

```javascript

  <!-- the html file -->
  <button id="btn">Click Me Too</button>

// the JavaScript file
  var btn = document.querySelector('#btn');
  btn.addEventListener('click', () => {
    alert("Hello World");
});
```

**_Protip: create named functions instead of lambda functions to do repetitive actions!_**

- adding `e` as an function parameter for onEvent function calls

#### Adding listeners to groups of nodes

Ref to how we got a nodelist of all the items that match a specific selector with
`querySelectorAll('selector')`

[TODO: extra practice JS stuff, skipped for now](https://github.com/wesbos/JavaScript30)
