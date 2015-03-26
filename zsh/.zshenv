export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export JAVA_HOME="$(/usr/libexec/java_home)"
export GOPATH=$HOME/work/go

# ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

path=(
  $HOME/bin
  $GOPATH/bin
  /usr/local/{bin,sbin}
  $path
)
