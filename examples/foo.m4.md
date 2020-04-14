1. one

   simply the chars one and newline, this doesn't match any macro(so far),
   so it's copied to the output as-is.
2. define(``one',` `ONE')dnl
   
   defines a macro named __one__(). From this point on, any input string one
   will be replaced with _ONE_.
3. one
   
   again the characters one and a newline, this is affected by the just-defined
   machro one(). The text __one__ is converted to the text _ONE_ and a newline.
4. define(``ONE',` `two')dnl
   
   defines a new macro named __ONE__(). Macro names are case-sensitive.
5. one ONE oneONE
   
   This line, has three space-separated tokens. The first is converted to _ONE_
   by the macro named __one__(), then both are converted to _two_ by the macro
   named __ONE__(). Rescanning doesn't find any additional matches. We end up with two two oneONE, since oneONE is not match a macro so it's output as-is.
6. `one'
   
   quoted text doesn't match any macros, so it's ouput as-is: _one_

# Notes:
### dnl
   The built-in __dnl__ function, stands for _delete to new line_ reads and discards all characters up to and including the next newline. One of it's uses is to put comments into an m4 file.
   To prove __dnl__ usefulness, let's remove those dnl calls and pipe the result to m4:

$ sed 's/dnl//' foo.m4 | m4

   results in:

one

ONE

two two oneONE
one

the two extra newlines, are at the places where __dnl__ used to be.
