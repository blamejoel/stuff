IP=$(ifconfig arc0 | grep inet\ | awk '{print $2}')
export PS1='\e[1;32m$IP\e[m:\e[1;34m\w\e[m\$ '
# PS1='devbox:\w\$ '
export PATH=$PATH:$HOME/bin
sh $HOME/start-server.sh
if [ -z $SSH_AUTH_SOCK ]; then
    eval `ssh-agent -s`
    ssh-add ~/.ssh/id_rsa
fi
cd ~/
