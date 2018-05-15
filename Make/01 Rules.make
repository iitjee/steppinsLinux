'make' is the general software name
GNU's make is a more narrow term i.e 'make' which is made by GNU


- Rule defines a target (i.e a file to be updated)
- Each target files depends on a set of prerequisites, which are also files
So both rules and targets are actually files.

When asked to update a target, make will execute the command script of the rule if any of the prerequisite files
has been modified more recently than the target.

Since target of one rule can be referenced as a prerequisite in another rule, the set of targets and prerequisites form a 
chain of dependencies (known as dependency graph). Building and processing this dependency graph to update the requested 
target is what 'make' is all about.

Rules:
1 - Explicit rules (indicate a specific target to be updated if it is out of date with respect to any of its prerequisites.
Most Common Type)

2 - Pattern rules (use wildcards instead of explicit filenames. This allows make to apply the rule any time a target file matching the pattern needs to updated)

3 - Implicit rules (either pattern rules or suffix rules found in the rules database built-in to make. Having a built-in 
database of rules makes writing makefiles easier since for many common tasks make already knows the file types, suffixes, and 
programs for updating targets.)

4 - Static pattern rules (like regular pattern rules except they apply only to a specific list of target files.)

