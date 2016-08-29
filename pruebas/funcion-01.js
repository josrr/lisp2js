function fibonacciRecursive(n) {
    return n < 2 ? n : fibonacciRecursive(n - 2) + fibonacciRecursive(n - 1);
};
function fibonacciTailRecursive(n, a, b) {
    if (a === undefined) {
        a = 0;
    };
    if (b === undefined) {
        b = 1;
    };
    return n === 0 ? a : fibonacciTailRecursive(n - 1, b, a + b);
};
