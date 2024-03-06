# Refer https://misc.flogisoft.com/bash/tip_colors_and_formatting for the ANSI/VT100 control sequences
local dir_color=081
local git_branch_color=010

# Uncomment the following line to hide the virtual environment name.
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# Directory details in blud, bold
local dir='$FG[${dir_color}]%~%{$reset_color%}'

prompt_git() {
	is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
	}
	if [ -d ".git" ]; then
		if is_dirty; then
			echo "yellow"
		else
			echo "green"
		fi
	fi
}

# git branch details in green
# local git_branch='%{$fg[yellow]%}${$(git_prompt_info):4}%{$reset_color%}'
local git_branch='%{$fg[$(prompt_git)]%}${$(git_prompt_info):4}%{$reset_color%}'

# date and time
local time='[%D{%m/%f %L:%M}]'

PROMPT="${time} ${dir}${git_branch}$ "

# PS1='[%D{%m/%f %L:%M}]%{%f%b%k%} %~$(git_branch_name) '
# Resetting color to default white.
preexec()
{
  echo -ne "\e[0m"
}

# Printing error message if command failed.
# precmd()
#{
  # Command failed
#  if [ $? -ne 0 ];
#  then
#    echo "${error_msg}"
#  fi
#}
