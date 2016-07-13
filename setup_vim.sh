#!/bin/sh

echo "Copying vim plugins and color profiles..."
cp -r vim/.vim ~/

echo "Checking for existing .vimrc file..."
if [ ! -f ~/.vimrc ]; then
    VIM_RES="created!"
    cp vim/.vimrc ~/
else
    VIM_RES="appended!"
    echo ".vimrc already exists!, appending new settings... check for conflicts"
    echo "" >> ~/.vimrc
    echo "\"Begin https://github.com/jgome043/stuff.git append" >> ~/.vimrc
    cat vim/.vimrc >> ~/.vimrc
fi

if [ -f ~/.vimrc ]; then
    echo ".vimrc" $VIM_RES
    echo "All set!"
else
    echo "Something went wrong... .vimrc creation/appending failed!"
fi
