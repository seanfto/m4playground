# Diverting 

m4 built-in diverse diversions have many uses, beyound the obvious one, discarding output, when using __divert(-1)__.
The defaut diversion is to 0, text written to diversion 0 goes to m4 standard output.

Text written to diversions 1, 2, and so on, is held until m4 exits or until you call __undivert()__. -1 is "nowhere", like the pseudo-file /dev/null.

The macro __divnum__ outputs the current diversion number.

Standard m4 support ten diversions, -1 through 9, while GNU m4 can handle unlimited number of diversions, in theory. In practice, the diverted text is held in memory until it runs out of memory, then moves the largest chunks of data to temporary files, so again, in practice GNU m4 is limited to the number of available file descriptors.

Output from a diversion is not rescanned for macros.

nl and nonl files show an example of divert usage.

GNU m4 also lets you oput a file content by calling __undivert__() instead of __include__(). One advantage of that is that the undiverting doens't scan the file content for macros. This simplifies the example from m4 includes, readfile.m4, one could just have written simply:

    undivert(`/etc/hosts')

and avoid all the __changequote__() and __esyscmd__()

# Frozen files

Large m4 applications can take a lot of time to load. GNU m4 supports a feature called frozen files, a way of speeding the loading of common base files. For example:

    $ m4 -F foo.m4f foo.m4

and later instead of using:

    $ m4 food.m4
one can use:

    $ m4 -R foo.m4f

for faster access to the common definitions.
