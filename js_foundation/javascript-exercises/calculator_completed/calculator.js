function add (x, y) {
	return x  + y;
	
}

function subtract (x ,y) {
	return x - y;
}

function sum (arr) {
	return arr.length > 0 
			? arr.reduce((elem, acc) => elem + acc)
			: 0;
}

function multiply (arr) {
	return arr.length > 0
			? arr.reduce((elem, acc) => elem * acc)
			: 0;
}

function power(x, y) {
	return x ** y;
}

function factorial(x) {
	return x == 0 ? 1 : x * factorial(x - 1);
}

module.exports = {
	add,
	subtract,
	sum,
	multiply,
    power,
	factorial
}