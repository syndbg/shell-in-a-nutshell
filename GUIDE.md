# Guide

There are different shells, but the ones we should care about are:

* Bourne shell (sh),
* Bourne Again shell (bash),
* Z shell (zsh)

For better shell script understanding, we're going through pain and suffering by using `sh` and in the end I'll say a bit about `bash` and `zsh`.


## Where to write the code

You have two choices:
* Writing it in the interpeter.
* Writing in files with suffix `.sh`.

1. Enter the interpeter by writing `sh` and start coding.
2. In a new file write your code and then execute it using `sh filename.sh` or `./filename.sh`, but the file must have read and execute permission for the given user. Give the needed permissions with `chmod u+rx filename.sh`


For faster learning and easier debugging the interpeter might be better, but after you feel a bit comfortable with the syntax, you'll want your code to persist in files.


## Boilerplate

Every shell script should start with a [shebang](http://en.wikipedia.org/wiki/Shebang_%28Unix%29) specifying what shell to use to execute the script.

The ones you would encounter the most are:

```sh
#!/bin/sh
#!/bin bash
#!/bin/zsh
```


## Hello world

As I said in the `INTRO.md`, the syntax is the same as in your shell (console) and you're free to use all the commands you know from there. In the example below you can see the familiar commands `echo` and `ls`.

```sh
#!/bin/sh

echo Chunky potato and Bacon Soup
ls
```


## Variables

It's important to mention that there are 2 types of variables:
* Shell - available only to the current shell,
* Environment - available to the current shell and child shells or processes.


To assign a shell variable, use the equal sign and **no spaces**, otherwise you'll get a syntax error.

```sh
LANGUAGE=shell
```

To assign an environment variable:
```sh
EXPORT LANGUAGE=shell
```

Or if you'd like to make an existing shell variable environmental:
```sh
LANGUAGE=shell
EXPORT LANGUAGE
```

You can also unset (delete) a variable:
```sh
unset LANGUAGE
echo $LANGUAGE # nothing!
```


And you can assign a readonly variable, that prevents it from being modified or deleted
```sh
readonly LANGUAGE=shell
LANGUAGE=javascript # won't be possible
unset LANGUAGE # again not possible
```

Or make an existing variable, readonly
```sh
LANGUAGE=shell
readonly LANGUAGE
```


And at last, if you want to assign a variable from stdin
```sh
read LANGUAGE
echo $LANGUAGE
```


*By conventions, variables should be uppercase*

## Magic variables?

You should've seen shell scripts where strange variables like `$@` or `$$` were used.

They have a purpose and that can be seen in this example script.
[variable-arguments.sh](variable-arguments.sh)
