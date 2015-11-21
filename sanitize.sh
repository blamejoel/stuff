#!/bin/sh

(cat $1 | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $1.cp)
(rm $1)
(mv $1.cp $1)
