#!/bin/bash

echo "Appending .bashrc for tmux color support..."
echo "# begin https://github.com/jgome043/stuff.git additions" >> ~/.bashrc
echo "# tmux 256 color support" >> ~/.bashrc
echo "if [ "$TERM" = "xterm" ]; then" >> ~/.bashrc
echo "    export TERM=xterm-256color" >> ~/.bashrc
echo "fi" >> ~/.bashrc
echo "alias tmux='tmux -2' # tmux 256 color fix" >> ~/.bashrc
echo "# end additions" >> ~/.bashrc

echo "Appending .inputrc ..."
echo "# begin https://github.com/jgome043/stuff.git additions" >> ~/.inputrc
echo "set bell-style none" >> ~/.inputrc
echo "# end additions" >> ~/.inputrc

echo "Appending .profile ..."
echo "# begin https://github.com/jgome043/stuff.git additions" >> ~/.profile
echo "DISPLAY=localhost:0.0" >> ~/.profile
echo "export DISPLAY" >> ~/.profile
echo "# end additions" >> ~/.profile

echo "Copying .vimrc ..."
bash ../setup_vim.sh
echo "Patching .vimrc for annoying Windows bell sound ..."
echo "\" patch for annoying Windows bell sound ..." >> ~/.vimrc
echo "set visualbell" >> ~/.vimrc

echo "Copying tmux.conf"
cp ../.tmux.conf ~/

echo "All set!"
