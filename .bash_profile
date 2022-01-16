export PATH="$HOME/.local/bin/:$PATH"

# enable vi editing mode
set -o vi
bind 'set show-mode-in-prompt on'

# Include filenames beginning with a "." in the filename expansion
shopt -s dotglob

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# # add checked out git branch to prompt
# if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " [%s] ")\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " [%s] ")\$ '
# fi
