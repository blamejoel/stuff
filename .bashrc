# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
# Use git 1.8.4 on ucr hammer server
source /opt/rh/devtoolset-2/enable
# Prevent gnome-ssh-askpass Gtk WARNING
unset SSH_ASKPASS
