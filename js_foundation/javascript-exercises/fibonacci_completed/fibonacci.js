const fibonacci = function (n) {

    if (n < 1) {
        return "OOPS";
    } else {
        return n == 1
            ? 1
            : n == 2
                ? 1
                : fibonacci(n - 1) + fibonacci(n - 2);
    }

}

module.exports = fibonacci
