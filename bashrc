# ------------------------------------------------------------------------------
# ~/.bashrc
# ------------------------------------------------------------------------------

# If not running interactively, don't do anything ------------------------------
[[ $- != *i* ]] && return

# Colours for ls
eval `dircolors -b`

# Charset
LANG=hu_HU.UTF-8

# Check window size
shopt -s checkwinsize

# History ----------------------------------------------------------------------
export HISTCONTROL=ignoredups
export HISTFILESIZE=5000
export HISTIGNORE="ls:ll:la:lla:cd:[bf]g:exit:..:...:"
hf(){
    grep "$@" ~/.bash_history
}

# Aliases ----------------------------------------------------------------------
# Directories
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias lla='ls -la --color=auto'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
cl() { cd $1; ls -la; }

# Bashmarks
alias cfg='cd ~/.eibon'
alias doc='cd ~/doc'
alias img='cd ~/img'
alias muz='cd ~/muz'
alias prj='cd ~/prj'
alias vid='cd ~/vid'

# Common apps
alias l='less'
alias v='vim'
alias untar='tar xvzf'

# Misc
alias reload='source ~/.bashrc'
alias nt='ping -c 5 index.hu'		#test network connection
alias df='df -h'					#disk usage in human readable form

# Completion -------------------------------------------------------------------
complete -F _command source
complete -F _command .

# Prompt -----------------------------------------------------------------------
PS1='[\[\e[1;36m\]\w\[\e[0m\]]\n $ '

# Path -------------------------------------------------------------------------
export PATH=$PATH:~/.bin:~/.scripts:~/.xmonad/bin
