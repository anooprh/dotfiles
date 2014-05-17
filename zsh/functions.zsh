function mkdcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
  
#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}

selfupdate(){
    URL="http://stuff.mit.edu/~jdong/misc/zshrc"
    echo "Updating zshrc from $URL..."
    echo "Press Ctrl+C within 5 seconds to abort..."
    sleep 5
    cp ~/.zshrc ~/.zshrc.old
    wget $URL -O ~/.zshrc
    echo "Done; existing .zshrc saved as .zshrc.old"
}
 
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}
 
check() {
    echo "ps -ef | grep -i \"*$1*\""
    ps -ef | grep -i "$1" | grep -v grep
}