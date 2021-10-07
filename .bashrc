# ls aliases
alias ls='ls --time-style=long-iso'
alias ll='ls -alh

# add checked out git branch to prompt
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " [%s] ")\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " [%s] ")\$ '
fi
