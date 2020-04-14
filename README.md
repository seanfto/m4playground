# A container for GNU M4 macro processor experiments

Usage:

Start by building the container

$ podman build -t m4container -f container.src

Then run it, as needed

$ sh startcontainer.sh

the examples directory contains a couple of m4 examples

The examples and annotations are retrieved from a couple of articles that were published in Linux Magazine in 2005.

More m4 notes can be found [here](http://mbreen.com/m4.html)

The reasonining of the limitations mentioned in examples/diverting.md are better explained [here](https://www.gnu.org/prep/standards/html_node/Semantics.html)

M4 as it was defined by K&R can been inspected in docs/m4.pdf
