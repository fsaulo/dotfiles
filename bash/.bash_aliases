# .bash_aliases [Saulo G. Felix]

alias cp="cp -i"
alias ll="ls -l"
alias df='df -h'
alias free='free -m'
alias np='nano -w PKGBUILD'
alias more=less
alias cbssh="cbf ~/.ssh/id_rsa.pub"
alias cbpwd="pwd | cb"
alias cbhs="cat $HISTFILE | tail -n 1 | cb"
alias zshconf="sudo vim ~/.zshrc"
alias bashconf="vim ~/.bashrc"
alias tmuxconf="vim ~/.tmux.conf"
alias vimconf="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias redo="source ~/.zshrc"
alias treset="tput reset"
alias matlab="/home/felix/.local/MATLAB/R2018a/bin/matlab"
alias cclip="xclip -sel clip -i"
alias pwdcp="pwd | cclip"
alias folding="python3 /home/felix/.local/tools/gnome-dash-fix/interactive.py"
alias goto="j"
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
alias chrome="bash /home/felix/.local/chromium/run.sh -desktop&"
alias castvlc="bash ~/.vlc -desktop& disown -a"
alias vim="vimx"
alias python="python3"
alias uecide="bash /home/felix/.local/uecide/uecide-0.10.6/uecide -desktop&"
alias logisim="java -jar /home/felix/.local/logisim/Logisim-Generic/logisim-generic.jar"
alias logisim-evolution="java -jar /home/felix/.local/logisim/Logisim-Evolution/logisim-evolution.jar"
alias adept="djtgcfg"
alias open="xdg-open"
alias typora="/home/felix/.local/share/Typora-linux-x64/Typora"
alias update="sudo dnf update -y"
alias pip="pip3"
alias clear-frequent="rm -rf ~/.local/share/gnome-shell/application_state"
alias eagle="QT_XCB_GL_INTEGRATION=xcb_egl /home/felix/.local/EAGLE/eagle-9.5.0/eagle"
alias powershell="pwsh"
alias scilab="/home/felix/.local/scilab/scilab.sh"
alias speedtest="speedtest-cli"
alias lg="lazygit"
alias xcout="xclip -o -selection clipboard"
alias academia="nbrepo academia"
alias nbbk="nb bookmark --skip-content home:links/"
alias nbweb="nb bookmark home:web/"
alias wiki="nbwiki"
alias artigos="nbwiki artigos"
alias diario="nbdiary"
alias diary="nbdiary"
alias quick="nbquick"
alias note="nbquick"
alias movies="nbrepo movies"
alias home="nbrepo home"
alias repo="nbrepo"
alias ranger="ranger-cd"
alias smux="tmuxinator start"
alias mocp="mocp -T orpheus"
alias gasific="cd /home/felix/Documents/Projects/gasific/; bash run.sh"
alias mux="tmuxinator"
alias clip="xsel -b"
alias simulide="/home/felix/.local/opt/simulide/simulide*.AppImage & exit"
alias srcidf="export IDF_PATH=${HOME}/.local/espressif/sdk/esp32; . ${IDF_PATH}/export.sh"
alias srcconda="source ~/.bash_conda"
