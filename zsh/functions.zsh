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

#VIM
v() {
    if [ -e ".session.vim" ] 
    then
        vim -S .session.vim
    else 
        vim $@
    fi  
}

#gvim
gv() {
    if [ -e ".session.vim" ] 
    then
        gvim -S .session.vim
    else 
        gvim $@
    fi  
}

#start mongoose web server wrapper
# Usage lserv       --> will start webserver at 8080 port
#       lserv -listening_port 7777 will start web server at 7777 port
lserv() {
    local ip_wifi=$(ifconfig wlp2s0 | grep "inet " | awk '{print $2}')
    local port_wifi="8080"
    local break_next="false"
    for val in "$@"
    do
        if [[ $break_next == "true" ]]; then
                break
        fi
        if [[ $val == "-listening_port" ]]; then
            break_next="true"
        fi
    done
    if [[ $break_next == "true" ]]; then
           port_wifi=$val 
    fi
    local url="http://${ip_wifi}:${port_wifi}"
    echo "Mongoose server strated: \n Directory `pwd` available at \n ${url}"
    echo "${url}" | xcopy
    mongoose $@
}
