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

*After the Hello World section, I'll skip writing the shebang in the `GUIDE.md`, but you can see it in the `code` folder*

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

Or you can assign many values to one variable as the `PATH` variable.
```sh
SKILLS=programming:reddit
echo $SKILLS
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



## Debugging

Before stepping into the weirder parts of Shell script, I should tell you
that you can set your interpreter in debug mode in two ways.

* Running your script using `sh -x filename.sh`,
* Setting `-x` in your script after the shebang - `set -x`

This will come in handy very soon.


## Exit codes

As seen in the `Magic variables` section, you can see the last command's exit code using `$?`. Exit codes are super important with conditions because the exit code of a command controls the flow through if/elif/else clauses.

The standard exit codes are `0` and `1`. `0` being a success, `1` being an error. There can be other codes returned by the program, but knowing the standard ones is the most important part.

## Conditionals

Shell script conditionals always work like other programming languages' conditionals... 5% of the time! :sweat_smile:

The template is

```sh
if [ condition ]; then
    #statements
fi

# You can have as many elifs as you want or none at all.
# And of course only one else.
if [ first_condition ]; then
    #statements
elif [ second_condition ]; then
    #statements
else
    #statements
fi
```

The condition part is an expression that will be evaluated by the test program. **If the exit code of the given expression is 0, it'll go in the `if` clause, otherwise it'll go to an `else` clause if such exists or just exit.**


The semicolon in the above example is used to separate the condition test program and the statement.

Otherwise you would write it like

```sh
if [ condition ]
then
    #statements
fi
```

The more common way is the semicolon one.


* Yep, the brackets are a separate program. You can confirm it by typing `man test`.


But there's a slight problem if we pass an empty variable. The expression will abort with an error:

```sh
if [ $1 = 'not-empty' ]; then
    echo "You gave me $1"
fi

# But with no arguments, it's evaluated to
# = 'not-empty'
```

We can also evaluate commands.
```sh
if whoami; then
    echo "Exit code was 0"
else
    echo "Something went wrong!"
fi
```

And there's this very cool pattern-matching conditional - `case`.

```sh
case $1 in
    what)
        echo "This"
        ;;
    we|want)
        echo "is"
        ;;
    to)
        echo "so"
        ;;
    match*)
        echo "cool"
        ;;
    *)
        echo "!"
        ;;
esac
```

The `;;` are very important, don't miss them or you'll get a syntax error.


## Logical constructs

These should be familiar to people writing in C-family languages like `C, C++, C# and Java`. They are the logical:

* `||` (OR) - if `A` OR `B` return a 0 exit code enter the conditional,
* `&&` (AND) - if `A` AND `B` return 0 exit codes, enter the conditional.

```sh
if [ "$1" = 3 ] || [ "$1" = 5 ]; then
    echo "I'm a psychic!"
fi
```

```sh
if [ "$1" ] && [ "$2"]; then
    echo "You gave me two arguments?"
fi
```


## Loops

There are two kinds of loops in Shell, `for each` and `while`. For better or worse, it's very similar to Python's situation.


The template for `for each` loop is:

```sh
for var in one two three many_items; do
    #action
done
```

And the `while` loop:

```sh
while condition; do
    #action
done
```


And the not so standard, `until` loop. Think of it as a negative `while`.

```sh
until condition; do
    #action
done
```

## More testing conditions

Only testing equality isn't that useful. We would like to be more flexibile in our logical conditions.

We can test:
* files,
* strings,
* arithmetics.


File type operators are:

| Operator      | Tests for   |
| ------------- |:-------------:|
| -b      | block device    |
| -c      | character device |
| -d      | directory      |
| -e     | existance |
| -f     | regular file |
| -h     | symbolic link |
| -p     | named pipe |
| -S     | socket |



File permissions operators are:

| Operator      | Tests for   |
| ------------- |:-------------:|
| -g     | setguid |
| -k     | sticky |
| -r      | readable |
| -u     | setuid |
| -w      | writable |
| -x     | executable |


Usage:

```sh
if [ -r $filename ]; do
    echo $filename
fi
```


String tests:

| Operator      | Returns true if   |
| ------------- |:-------------:|
| -z     | empty |
| -n     | not empty |


Arithmetic tests:

| Operator      | Returns true if first argument is.. to second |
| ------------- |:-------------:|
| -eq     | equal |
| -ne     | not equal |
| -gt     | greater than |
| -lt     | lesser than |
| -ge     | greater than or equal |
| -le     | lesser than or equal |


## Command substitution

We can get a command's stdout and assign it to a variable or use it as a condition.

To do so:
```sh
USER=$(whoami)
if [ $USER ]; then
    echo "Logged in as $USER"
fi
```


## Arithmetics

`sh` supports arithmetics, just like other programming languages do.

Now that we understand `command substitution`, we can do arithmetics.

The supported operations are:

* `+` addition,
* `-` subtraction,
* `*` multiplication,
* `/` division,
* `%` modulus,
* and many more that you can see at `man expr`.

However if we write
```sh
a=5+4
echo $a
# The above will remain a string and won't be evaluated
```

If we want to evaluate an expression we must use the a substitution of `expr` command.
```sh
a=$(expr 5 + 4)
echo $a
```


## Temporary files

Are useful if you want to capture a command's output to a file.
Temporary files are usually created in the `/tmp/` folder and deleted on reboot.
But if you want to delete them sooner, you must do so manually.

You create temporary files using `mktemp`, which is part of `GNU coreutils`.

By default the filenames are tmp.<random_hash>

```sh
tmpfile=$(mktemp)
# /tmp/tmp.T2RKRfdYeN
```

But you can give them a desired file name template or location.

```sh
tmpfile=$(mktemp ~/delete.XXXXX)
# The Xses will be replaced by the same amount of random characters
```


## Includes

Are as simple as. The command below will run all the functions in the file

```sh
. file.sh
```
