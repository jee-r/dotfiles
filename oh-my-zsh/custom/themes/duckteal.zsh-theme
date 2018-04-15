# RVM settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then 
  RPS1="%{$fg[yellow]%}rvm:%{$reset_color%}%{$fg[red]%}\$(~/.rvm/bin/rvm-prompt)%{$reset_color%} $EPS1"
else
  if which rbenv &> /dev/null; then
    RPS1="%{$fg[yellow]%}rbenv:%{$reset_color%}%{$fg[red]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$reset_color%} $EPS1"
  fi
fi
user_color_and_host() {
  if [[ "$EUID" = "0" ]] || [[ "$USER" = 'root' ]]
  then
    echo "%{$fg[red]%}[%{$reset_color%}%{$fg_bold[red]%}%n%{$reset_color%}%{$fg_bold[red]%}@%{$fg_bold[red]%}%m%{$reset_color%}%{$fg[red]%}]%{$reset_color%}"
  else
    echo "%{$fg[cyan]%}[%{$reset_color%}%{$fg_bold[cyan]%}%n%{$reset_color%}%{$fg_bold[blue]%}@%{$fg_bold[cyan]%}%m%{$reset_color%}%{$fg[cyan]%}]%{$reset_color%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='$(user_color_and_host)$(git_custom_status)%{$fg[cyan]%}[%~% ]%B$%b%{$reset_color%} '
