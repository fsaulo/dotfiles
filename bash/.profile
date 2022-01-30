# .profile [Saulo G. Felix]

# fzf git keybindings
# --------------------------
# ctrl-g ctrl-f for files
# ctrl-g ctrl-g for branches
# ctrl-g ctrl-t for tags 	 [disabled]
# ctrl-g ctrl-r for remotes  [disabled]
# ctrl-g ctrl-h for hashes
# --------------------------
if [[ $- =~ i ]]; then
  bind '"\er": redraw-current-line'
  bind '"\C-g\C-f": "$(_gf)\e\C-e\er"'
  bind '"\C-g\C-g": "$(_gb)\e\C-e\er"'
  bind '"\C-g\C-t": "$(_gt)\e\C-e\er"'
  bind '"\C-g\C-h": "$(_gh)\e\C-e\er"'
  bind '"\C-g\C-r": "$(_gr)\e\C-e\er"'
fi

# source autojump environment variable
if [ -f /usr/share/autojump/autojump.bash ]; then
	source /usr/share/autojump/autojump.bash
fi

# source for aliases scripts
if [ -f ~/.bash_aliases ]; then
	source ~/.bash_aliases
fi

# source for custom bash scripts
if [ -f ~/.bash_scripts ]; then
	source ~/.bash_scripts
fi

eval `keychain -q --noask --eval id_ed25519`

# local variables and assigments
FD_OPTIONS="--type f -H --follow --exclude .git --exclude node_modules"

# user specific environment and startup programs
export MYSQL=/home/felix/.local/share/jvr/jar/mysql-connector/mysql-connector-java-8.0.11.jar
export PATH_TO_FX=/home/felix/.local/share/jvr/jar/javafx-sdk-13/lib/
export ELECTRON_TRASH=gio trash
export GPG_TTY=$(tty)
export EDITOR=/usr/bin/vimx
export UECIDE=/home/felix/.uecide
export M4PATH="/home/felix/.local/share/Circuit_macros:"
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.local/opt/riscv/bin:$PATH
export SQLITE=/home/felix/.local/share/jvr/jar/sqlite-connector/sqlite-jdbc-3.27.2.1.jar
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk/
export NO_AT_BRIDGE=1
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND='git ls-files --cached --others --exclude-standard | fd $FD_OPTIONS'
export FZF_DEFAULT_OPTS="--inline-info -m --bind='ctrl-y:execute-silent(echo {} | xclip -i -selection clipboard)+abort'"
export QT_QPA_PLATFORMTHEME=
export SSH_ASKPASS=/usr/bin/ksshaskpass
