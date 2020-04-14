# Debugging

The recursion and quoting available in m4 can make tracing and debugging a challange.

Studying the internals helps, of course, and m4 also has built-in techniques:

* using __dumpdef__() to see a macro definition, after the initial layer of of quoting is stripped off.

* the __traceon__() macro traces the execution of the macros you name as arugments, or all macros, if you invoke it without a list of macros. Depth of expansion is typically 1. Use __traceoff__ to stop tracing.

* the __debugmode__() macro accepts a strong of flags, all are described in the info file for m4. Debugging flags can be specified on the command line with -d or --debug, when invoking m4.

More about m4 can be seen with a Google search for *m4 macro*.

See also, the technical report by Ken Turner, CSM-126 in docs/expl-m4.pdf

More examples of m4 usage can be seen in the latest GNU m4 releases, in doc/examples directory.

Happy hacking!
