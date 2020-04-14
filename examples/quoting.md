# Quoting

$ cat quoting | m4

will output:

    A:      100
    B:      100
    C:      A
    m4:stdin:5: undefined macro `100'
    m4:stdin:5: undefined macro `100'
    m4:stdin:5: undefined macro `100'
    100 100 100

Any text surrounded by `' (a grave accent and an acute accent) isn't expanded immediately.
The listing in quoting ifle, starts by defining three macros A, B and C.
A has the value 100. So does B, because it's argument A isn't quoted, so m4 replaces A with 100 before assigning that value to B. While for C,
the quoted argument means that it's value becomes literal A.

Calling __dumpdef__ built-in function with the names of the macros will print the values. As expected, A and B have the value 100, and C has A.

The second __dumpdef__ call the names are not quoted, so each name is expanded to 100. This produces the error messages, because there's no macro named 100.

The quoting characters can be changed with __changequote__.

For text containing lots of quote marks, you could call __changeqoute({,})__ to change the quoting to curly braces.

And then call __changequote__ again with no arguments, to restore defaults.

It's a good idea, for safety to quote all input text that isn't a macro call. This avoids m4 interpreting a literal word as a call to a macro. Another way to avoid this problem is by using the GNU m4 option --prefix-builtins or -P. It changes all built-in macro names to be prefixed by m4_. So, under this option, you'd write m4\_dnl and m4\_define instead of __dnl__ and __define___.

More tips on quoting [here](https://web.archive.org/web/20150403130114/http://owen.sj.ca.us/rkowen/howto/webpaging/m4tipsquote.html)
