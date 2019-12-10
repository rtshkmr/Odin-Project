# The Odin Project JavaScript Fundamentals

sources:

- [w3schools Js tutorials](https://www.w3schools.com/js/)

- [MDN stuff about Js](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/)

- [basic stuff about objects in JavaScript](https://www.w3schools.com/js/js_objects.asp)

## Js Types

## evaluation rules

- left to right
- Precedence rules, google it.

### Numbers: the only data type for numbers in Js (other than BigInt)

- Js numbers are always 64bit floats
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

### Binary Operators

In general, Js implicitly converts type.

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

```.javascript
var x = [0,1,2,3,4,5,6,7,8,9]
var a = [x, x, x, x, x];

for (var i = 0, j = 9; i <= j; i++, j--)
  console.log('a[' + i + '][' + j + ']= ' + a[i][j]);
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

```.javascript
    var x = new Number(500);
    var y = new Number(500);
    x == y
```

## Number Methods and Properties

- usually, primitives can't have any properties or methods, only objects can. **JS is different**

- properties only work on numbers, won't on variables!

- `toString()` method returns number from literal/variable/exp input
- `toExponential()` method returns string, in standard form (with rounding done if you input significant fig param)
- `toFixed()` returns string, w number written to a specified number of decimals as per input
- `toPrecision()`: return to a certain sig fig
- `valueOf()` returns number as a number. internally used in underlying Js, no reason to actually include in our own code.

### 3 ways to convert Variable to Numbers

these are global methods, not number methods.

- `Number()`
- `parseInt()` : only returns the first int, ignores trailing decimals or spaced out ints, provide the first word can be converted in the first place
- `parseFloat()`

true will have number value of 1 and false will have number value of 0

- if you use `Number()` on a `date` type, then you yield the number of miliseconds since 1.1.1970!

- `alert( +apples + +oranges ); // 5` same as `alert( Number(apples) + Number(oranges) ); // 5` holy hell. This is because **\_unary pluses are applied before binary pluses**

## Variables in JavaScript

## Arrays

- two ways to create:
  `var cars = new Array("Saab", "Volvo", "BMW");` [redundant way]
  or`var cars = ["Saab","Volvo","BMW"];`

- full array access:
