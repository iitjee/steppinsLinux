PHONY TARGETS:

Until now all targets and prerequisites have been files to be created or updated. This
is typically the case, but it is often useful for a target to be just a label representing a
command script.
For instance, earlier we noted that a standard first target in many
makefiles is called all. Targets that do not represent files are known as phony targets.

EXAMPLE 1:
                  count_words: count_words.o lexer.o -lfl
                    gcc count_words.o lexer.o -lfl -o count_words
                  count_words.o: count_words.c
                    gcc -c count_words.c
                  lexer.o: lexer.c
                    gcc -c lexer.c
                  lexer.c: lexer.l
                   flex -t lexer.l > lexer.c

Makefiles are usually structured top-down so that the most general target, often
called "all", is updated by default. More and more detailed targets follow with targets
for program maintenance, such as a "clean" target to delete unwanted temporary files,
coming last. 

Another standard phony target is clean:
EXAMPLE 2:
                    clean:
                     rm -f *.o lexer.c
Normally, phony targets will always be executed because the commands associated with the rule do not create the target name.



It is important to note that make cannot distinguish between a file target and phony
target. If by chance the name of a phony target exists as a file, make will associate the
file with the phony target name in its dependency graph. 
EXAMPLE 3:
                      $ make clean
                      make: `clean' is up to date.

Since most phony targets do not have prerequisites, the clean target would always be
considered up to date and would never execute.
To avoid this problem, GNU make includes a special target, .PHONY, to tell make that a target
is not a real file. Any target can be declared phony by including it as a prerequisite of .PHONY:
                        .PHONY: clean
                        clean:
                        rm -f *.o lexer.c
Now make will always execute the commands associated with clean even if a file named clean exists. 









