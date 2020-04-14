# Conditionals and Math

The built-in functions __eval__, __incr__ and __decr__ help with the arithmetic as m4 doesn't support loops directly. But, by combining recursion and decision macro __ifelse__ we can write loops.

running

    $  m4 conditionals.m4
    5, 4, 3, 2, 1, 0, Liftoff!
    

The __countdown__() macro has a single argument and it's broken across two lines. That's fine because m4 are delimited by parantheses and can span on many lines.
Here's the argument that __countdown__() macro defines, wihtout quotes, for more clarity:

    $1, ifelse(eval($1 > 0), 1,
    `countdown(decr($1))', `Liftoff!')
    )
    
$1 expands to the macro's first argument, when m4 evaluates __countdown__ macro when an argument of 5, the result is:

    5, ifelse(eval(5 > 0), 1,
    `countdown(decr(5))', `Liftoff!')
    )
    
The leading 5 is plain text that's outputed as-is as the first number in the *countdown*. The rest of the argument is a call to built-in __ifelse__. __ifelse__ compares the first two arguments, if they're equal, the third argument is evaluated, otherwise, the optional fourth agrument is evaluated. This leads to a recursive call, to __countdown(4)__.

With more than four arguments, the built-in __ifelse__ can work as a __case__ or __switch__ for instance *ifelse(a,b,c,d,e,f,g) translates to 

    if a matches b, then c;
    else if d matches e then f;
    else g;

More looping and decision techniques can be seen in the m4 info files, including a macro named __forloop__() which implements a nestable for-loop.
