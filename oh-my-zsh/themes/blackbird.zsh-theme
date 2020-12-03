user_color_and_host() {
  if [[ "$EUID" = "0" ]] || [[ "$USER" = 'root' ]]
  then
    echo "%{$fg[yellow]%}[%{$reset_color%}%{$fg_bold[yellow]%}%n%{$reset_color%}%{$fg_bold[yellow]%}@%{$fg_bold[yellow]%}%m%{$reset_color%}%{$fg[yellow]%}]%{$reset_color%}"
  else
    echo "%{$fg[black]%}[%{$reset_color%}%{$fg[yellow]%}%n%{$reset_color%}%{$fg[black]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[black]%}]%{$reset_color%}"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[black]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[black]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}•%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='$(user_color_and_host)$(git_custom_status)%{$ft[black]%}[%~% ]%B$%b%{$reset_color%} '
