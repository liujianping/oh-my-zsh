function alias-find(){
    alias | grep $1
}

alias af="alias-find "

# z jump ;;; use autojump
# . /usr/local/etc/profile.d/z.sh

# c alias for vscode
alias c="code"

##kubectl alias, kubectl installed required
alias kls="kcgc"
alias kcd="kcuc"

## macos 
function lock(){
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}
function reboot(){
    sudo shutdown -r now
}

alias lk="lock"

## golang code review, golangci-lint installed required
alias glt="golangci-lint"

cover () {
  t=$(mktemp)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
}

cover-val(){
  cover $@ | grep ^total | awk '{print $3}' | awk -F. '{print $1}'
}

cover-cmp(){
  cmp=$1
  shift
  val=$(cover-val $@)
  num=$(($val+0))
  if [ $cmp -gt  $num ]; then
	echo "coverage insufficient."
	return 1
  fi	
  return 0
}

cover-web() {
  t=$(mktemp)
  go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
}

## replace ls as exa ;;; brew install exa , required
alias ls="exa"
alias lt="lsa -T"

## fzf alias
 
function fzf-preview(){
	fzf --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 (bat --style=numbers --color=always {} ||
                  highlight -O ansi -l {} ||
                  coderay {} ||
                  rougify {} ||
                  cat {}) 2> /dev/null | head -500'
}

alias fp="fzf-preview"
