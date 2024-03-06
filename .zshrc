# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="color-input"
HIST_STAMPS="mm/dd/yyyy"

alias vi='nvim'
alias python='python3'
alias sudo='sudo '
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# History command
HISTSIZE=10000000
HISTFILESIZE=20000000
alias history="history 1"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)


# Paths
export "PATH=/usr/local/bin/:$PATH"

# zsh tab completion fix capitalization error for dirs and files
# reference: https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
 
# A little bit more information:
# This is possible when using the zsh completion system (started by autoload -Uz compinit && compinit) and is controlled by a zstyle:
 
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# This tells zsh that small letters will match small and capital letters. (i.e. capital letters match only capital letters.)
 
# See also the description of matcher-list in man zshcompsys.
autoload -Uz compinit && compinit
# Using prompt in ~/.oh-my-zsh/custom/themes/color-input.zsh-theme
export LS_COLORS="di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=34;40:"
zstyle ':completion:*:default' matcher-list 'm:{a-z}={A-Za-z}' list-colors ${(s.:.)LS_COLORS}


# lfcd
LFCD="/Users/ky/.config/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'

# Loading zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $ZSH/oh-my-zsh.sh
