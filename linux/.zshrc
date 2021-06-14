# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/h2y/.oh-my-zsh"

# Path to yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Path to anaconda
export PATH="/home/h2y/anaconda3/bin:$PATH"

# Path to z.sh
. ~/z.sh

# Set the starting directory
cd ~/dev/hoehooiyan

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="macos-zsh-theme/macos-theme"
# amuse
# half-life
# macos-zsh-theme/macos-theme
# spaceship
# theunraveler
# zhann

# Load plugins
plugins=(zsh-nvm zsh-autosuggestions git)

source $ZSH/oh-my-zsh.sh

# ---------------------
# Aliases
# ---------------------

# custom aliases
alias c="code"
alias la="ls -a"
alias lla="ls -la"
alias open="xdg-open"
alias o="xdg-open"
alias vz="vim ~/.zshrc"
alias cz="code ~/.zshrc"
alias sz="source ~/.zshrc"
alias hoe="cd ~/dev/hoehooiyan"
alias ew="cd ~/eclipse-workspace"
alias pg="echo 'Pinging Google' && ping www.google.com"

# git aliases
alias add="git add"
alias clone="git clone"
alias ci="git commit"
alias cim="git commit -m"
alias pull="git pull"
alias push="git push"
alias co="git checkout"
alias conew="git checkout -b"
alias gitc="gitmoji -c"
alias gl="git log --oneline"
alias gd="git diff"
alias grv="git remote -v"
alias gra="git remote add"
alias gb="git branch"
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
alias st='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

# npm aliases
alias ni="npm install"
alias nr="npm run"
alias ns="npm run start"
alias nkill="npx npkill"
alias ng="npm list -g --depth 0"

# yarn aliases
alias ys="yarn start"
alias yd="yarn dev"
alias yi="yarn install"
alias yb="yarn set version berry"
alias ybb="yarn set version berry"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/h2y/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/h2y/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/h2y/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/h2y/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
