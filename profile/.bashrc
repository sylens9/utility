# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
source ~/.git-prompt.sh
PS1='\n\$ \[\e[34m\]\u\[\e[0m\] \[\e[35m\]\w\[\e[0m\] \[\e[36m\]$(__git_ps1 "(%s)")\[\e[0m\] \t \$\n$ '
export HISTTIMEFORMAT='%F %T  '
alias b2m='figlet building...; b2 -j16'
alias vim8='/opt/vim8/bin/vim -u ~/.vim8rc'
ulimit -c unlimited
