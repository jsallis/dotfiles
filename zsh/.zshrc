# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# disable autocorrect
unsetopt CORRECT

alias gitg='noglob gg'
unalias rm

delete_all_docker_containers()
{
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
}
