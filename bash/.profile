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

if [ -f ~/.bash_git ]; then
	source ~/.bash_git
fi

eval `keychain -q --noask --eval id_ed25519`

# local variables and assigments
XTENSA_LX106=".local/espressif/toolchain/xtensa-lx106-elf/bin"

# user specific environment and startup programs
export IDF_PATH=$HOME/.local/espressif/sdk/esp8266
export GPG_TTY=$(tty)
export EDITOR=/usr/bin/vimx
export NO_AT_BRIDGE=1
export TERM="xterm-256color"
export QT_QPA_PLATFORMTHEME=kde
export SSH_ASKPASS=/usr/bin/ksshaskpass
export NB_DIR=$HOME/Dropbox/Documents/workspace/notes
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/$XTENSA_LX106:$PATH
