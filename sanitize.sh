#!/bin/sh
# Simple script for sanitizing keyboard input from script program output for

# Takes the "contaminated" script file as a parameter.
# Line below is a modified version of the script provided by the TAs, but 
# takes the script file as a parameter rather than hardcoding a filename in.
(cat $1 | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $1.cp)

# Then deletes the original and renames the sanitized file to the original
(rm $1; mv $1.cp $1)
