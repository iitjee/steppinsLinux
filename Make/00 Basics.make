The make program  is  intended  to  automate  the  mundane  aspects  of  transforming
source code into an executable.

The advantages of make over scripts is that you can specify the relationships between the elements of your program to
make, and it knows through these relationships and timestamps exactly what steps need to be redone to produce the desired 
program each time. Using this information,make can also optimize the build process avoiding unnecessary steps.

              hello: hello.c
                      gcc hello.c -o hello.o




Basic Syntax:

 a makefile contains a set of rules used to build an application.
  "first rule seen by make is used as the default rule"
Each rule consists of three parts: the target, its prerequisites, and the command(s) to perform

target1 target2 target3 : preereq1 prereq2
        command1
        command2
        command3

target is the file or thing that must be made.
prerequisites or dependents are those files that must exist before the target can be successfully created.
commands are those shell commands that will create the target from the prerequisites.

Example 1:
a 'rule' for compiling a C file, foo.c, into an object file, foo.o:

                foo.o: foo.c foo.h
                  gcc -c foo.c

target file is foo.o 
prerequisites foo.c and foo.h appear after the colon. 
the command script is preceded by a tab character.

Each command MUST begin with a tab character. This (obscure) syntax tells make that the characters that follow the tab are 
to be passed to a subshell for execution. (If you accidentally insert a tab as the first character of a non-command line, 
make will interpret the following text as a command under most circumstances. )

When make is asked to evaluate a rule, it begins by finding the files indicated by the
prerequisites and target. If any of the prerequisites has an associated rule, make
attempts to update those first. Next, the target file is considered. 

If any prerequisite is newer than the target, the target is remade by executing the commands.

Each command line is passed to the shell and is executed in its own subshell. If any of the
commands generates an error, the building of the target is terminated and make exits.
One file is considered newer than another if it has been modified more recently.





Example 2:
                  count_words: count_words.o lexer.o -lfl
                    gcc count_words.o lexer.o -lfl -o count_words
                  count_words.o: count_words.c
                    gcc -c count_words.c
                  lexer.o: lexer.c
                    gcc -c lexer.c
                  lexer.c: lexer.l
                   flex -t lexer.l > lexer.c

Execution Order:
 make
gcc -c count_words.c
flex -t lexer.l > lexer.c
gcc -c lexer.c
gcc count_words.o lexer.o -lfl -o count_words

Explanation:
1. First make notices that the command line contains no targets so it decides to make the
default goal, count_words. (count_words is just a label. a target is usually a .o file. see previous example)

2. It checks for prerequisites and sees three: 
-> count_words.o, 
-> lexer.o, and 
-> -lfl

3. make now considers how to build "count_words.o" and sees a rule for it. Again, it checks the prerequisites, notices that 
count_words.c has no rules but that the file exists, so make executes the commands to transform count_words.c into
count_words.o by executing the command: gcc -c count_words.c

4. This “chaining” of targets to prerequisites to targets to prerequisites is typical of how
make analyzes a makefile to decide the commands to be performed.

5. The next prerequisite make considers is lexer.o. Again the chain of rules leads to lexer.
c but this time the file does not exist. make finds the rule for generating lexer.c from
lexer.l so it runs the flex program. Now that lexer.c exists it can run the gcc command.

6. Finally, make examines -lfl. 
The -l option to gcc indicates a system library that must be linked into the application. The actual library name indicated 
by “fl” is libfl.a. GNU make includes special support for this syntax. 
When a prerequisite of the forml<NAME> is seen, make searches for a file of the form libNAME.so; if no match is found,
it then searches for libNAME.a. 
Here make finds /usr/lib/libfl.a and proceeds with the final action, linking



Makefiles are usually structured top-down so that the most general target, often
called "all", is updated by default. More and more detailed targets follow with targets
for program maintenance, such as a clean target to delete unwanted temporary files,
coming last. As you can guess from these target names, targets do not have to be
actual files, any name will do.




# is used for commenting in makefile
\ is used to make multiline make command


