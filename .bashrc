# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    etc/bashrc
fi

source ~/perl5/perlbrew/etc/bashrc
source /home/sillymoose/projects/git-hub/init
export TERM=xterm-256color
export PS1="\w "

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
