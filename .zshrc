HOST_NAME=pwd

source ~/.nvm/nvm.sh
nvm use stable

setopt autocd
setopt appendhistory
setopt sharehistory
setopt INC_APPEND_HISTORY
#setopt HIST_IGNORE_DUPS
#setopt EXTENDED_HISTORY

export PATH=$PATH:$HOME/bin

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.bash_history
export HISTFILESIZE=10000

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")
#emojis=("🃏" "⚡" "🌑" "🌗" "♒" "🌕")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

precmd () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=precmd
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

#fortune | cowsay -f tux
#buckle &
#neofetch

function mkcd()
{
	mkdir $1 && cd $1
}

# -------
# Arch Aliases
# -------
alias ls='ls --color=auto'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ff='find / -name'
alias f='find . -name'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip -c'
alias pacman='pacman --color=auto'
alias pactree='pactree --color'
alias vdir='vdir --color=auto'
alias watch='watch --color'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias buckle='buckle -f -p /usr/local/share/bucklespring/wav &'
# -------
# Aliases
# -------
alias 🍺="git checkout -b drunk"
alias a='code .'
alias c='code .'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias l="ls" # List files in current directory
alias ll="ls -al -h" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/autojump/autojump.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
