function foo(x) {
    return x + 1;
};
(function (x) {
    switch (x) {
    case 1:
        for (var _js1 = 0; _js1 < 3; _js1 += 1) {
            alert('foo');
        };
        return;
    case 'bar':
        return alert('bar');
    default:
        return 4;
    };
});
(function () {
    for (var x = 0; x < 3; x += 1) {
        x + x;
    };
})();
