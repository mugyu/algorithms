// Z combinator
Z = f => {
    return ( x => {
        return f( y => {
            return x(x)(y);
        });
    })
	( x => {
        return f( y => {
            return x(x)(y);
        });
    });
}

result = Z( f => { return n => { return n == 0 ? 1 : n * f(n - 1); }; } )(5)
console.log(result);

result = Z( f => { return n => { return n == 1 ? 1 : n + f(n - 1); }; } )(10)
console.log(result);

fib = Z( f => { return n => { return n < 2 ? n : f(n - 2) + f(n - 1); }; } )
for(let i = 0; i < 10; i++)
{
	console.log('' + i + ' : '  + fib(i))
}
