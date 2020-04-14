# Include and working with files

m4 built-in __include__() macro takes m4 input for a named file until the end of that file. There's also a macro __sinclude__() that won't complain if the file doesn't exist.
GNU m4 searches the current directory, then directories specified with -l command-line option, then any directories in the colon-separated M4PATH environment variable.

Including files is often used to read in other m4 code, but can also be used to read plain text files. This is where the __changequote__ can be used to override the qouting characters.

readfile.m4 is an example how to filter input through utilities like __tr__ or __sed__.

The option -D or --define let's you define a macro from the command line, before any input files are read.

    $ m4 -Dfile=/etc/hosts readfile.m4

