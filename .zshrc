alias vi="nvim"
alias gst="git status"
alias python="python3"

# Paths

export "PATH=/usr/local/bin/:$PATH"
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '['$branch']'
  fi
}
# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt.
PS1='[%D{%m/%f %L:%M}]%{%f%b%k%} %~$(git_branch_name) '
# zsh tab completion fix capitalization error for dirs and files
# reference: https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
 
# A little bit more information:
# This is possible when using the zsh completion system (started by autoload -Uz compinit && compinit) and is controlled by a zstyle:
 
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# This tells zsh that small letters will match small and capital letters. (i.e. capital letters match only capital letters.)
 
# See also the description of matcher-list in man zshcompsys.
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# lfcd
LFCD="/Users/ky/.config/lf/lfcd.sh"                                #  pre-built binary, make sure to use absolute path
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bindkey -s '^o' 'lfcd\n'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
