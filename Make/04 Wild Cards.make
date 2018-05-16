A makefile often contains long lists of files. To simplify this process make supports
wildcards (also known as globbing).

Wildcards are automatically expanded by make whenever a wildcard appears in a target,
prerequisite, or command script context. In other contexts, wildcards can be
expanded explicitly by calling a function. Wildcards can be very useful for creating
more adaptable makefiles

EXAMPLE 1:
                          prog: *.c
                           $(CC) -o $@ $^
The prerequisite contains all the files without explicitly mentioning them

It is important to be careful with wildcards, however. It is easy to misuse them as the
following example shows:
EXAMPLE 2:
                          *.o: constants.h
The intent is clear: all object files depend on the header file constants.h, but consider
how this expands on a clean directory without any object files:
                          : constants.h
This is a legal make expression and will not produce an error by itself, but it will also
not provide the dependency the user wants. The proper way to implement this rule is
to perform a wildcard on the source files (since they are always present) and transform
that into a list of object files. (will cover this technique later)

Finally, it is worth noting that wildcard expansion is performed by make when the pattern appears as a target or prerequisite. 
However, when the pattern appears in a command, the expansion is performed by the subshell. 
This can occasionally be important because make will expand the wildcards immediately upon reading the
makefile, but the shell will expand the wildcards in commands much later when the command is executed. When a lot of complex 
file manipulation is being done,the two wildcard expansions can be quite different.
