The make program  is  intended  to  automate  the  mundane  aspects  of  transforming
source code into an executable.

The advantages of make over scripts is that you can specify the relationships between the elements of your program to
make, and it knows through these relationships and timestamps exactly what steps need to be redone to produce the desired program 
each time. Using this information,make can also optimize the build process avoiding unnecessary steps.

              hello: hello.c
                      gcc hello.c -o hello.o




Basic Syntax:


target1 target2 target3 : preereq1 prereq2
        command1
        command2
        command3


Each command must begin with a tab character. This (obscure) syntax tells make that the characters that follow the tab are to be 
passed to a subshell for execution.

# is used for commenting in makefile
\ is used to make multiline make command



- Rule defines a target (i.e a file to be updated)
- Each target files depends on a set of prerequisites, which are also files
So both rules and targets are actually files.


Since target of one rule can be referenced as a prerequisite in another rule, the set of targets and prerequisites form a chain
of dependencies (known as dependency graph). Building and processing this dependency graph to update teh requested target is what 
'make' is all about.

Rules:
- Explicit rules
- Pattern rules
- Implicit rules
- Static pattern rules

