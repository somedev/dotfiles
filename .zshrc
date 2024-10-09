# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias gr='git pull; git fetch -p'
alias gbd='git branch -d'
alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git add . && git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'

# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias glg='git log --all --decorate --oneline --graph'
alias gll='git log --pretty=format:"%s"'

# -------------------------------------------------------------------
# OTHER aliases
# -------------------------------------------------------------------
alias his='history | grep -i'
alias cl='clear'
alias ll='ls -la'
alias slog='pmset -g log|grep -e " Wake  "'
# -------------------------------------------------------------------
# FUNCTIONS
# -------------------------------------------------------------------
function makegif() {
    if [[ $# -eq 2 ]]; then
        ffmpeg -i $1 \
            -t $2 \
            -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
            -loop 0 ${1%.*}.gif
    elif [[ $# -eq 1 ]]; then
        ffmpeg -i $1 \
            -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
            -loop 0 ${1%.*}.gif
    else
        echo "Invalid number of arguments"
        echo "Usage: makegif VIDEO [seconds]"
    fi
}
