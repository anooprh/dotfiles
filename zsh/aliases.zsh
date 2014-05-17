# Git Aliases

alias gpom="git push -u origin master"
alias gs="git status"
alias g="git"
alias gp="git pull --rebase && git push"
alias gpr="git pull --rebase"
alias grh='git reset --hard'
alias gch='git checkout'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gk='gitk'
alias gd='git diff --color'
alias st='stree'
alias gg='git-gui'
alias gl="git log --oneline -10"
alias glcid="git log --oneline -1 | awk '{print $1}' | pbcopy"
alias gl6="git log --oneline -5"
alias gl3="git log --oneline -3"
alias gpup='git pull && git submodule init && git submodule update && git submodule status'

# Tomcat Aliases

alias tc='$CATALINA_HOME/bin/catalina.sh'

# Maven Aliases

alias mcis='mvn clean install -DskipTests'
alias mcisw='cd .. && mcis && cd ${PWD##*/}-web'
alias mci='mvn clean install'
alias mls='mvn -P load.seed.data'
alias mlsjr='mls && mjr'
alias mlsjra='cd ${PWD##*/}.web && mlsjr'
alias mciw=' cd .. && mci && cd ${PWD##*/}-web'
alias mjr='mvn jetty:run'
alias mjra='cd ${PWD##*/}-web && mjr'
alias mdjr='mvnDebug jetty:run'
alias mcijr='mci && cd ${PWD##*/}-]web && mjr'
alias mcisjr='mcis && cd ${PWD##*/}-web && mjr'
alias mcidjr='mci && cd ${PWD##*/}-web && mdjr'
alias mcisdjr='mcis && cd ${PWD##*/}-web && mdjr'
alias mcijrw='cd .. && mcijr'
alias mcisjrw='cd .. && mcisjr'
alias mcidjrw='cd .. && mcidjr'
alias mcisdjrw='cd .. && mcisdjr'


#Gradle Aliases
alias gr='gradlew'
alias grsb='gradlew startBanner'
alias grr='gradlew run'
alias grb='gradlew build'
alias grft='gradlew runFt'
alias grrs='gradlew runStub'


# VLC Aliases

alias vlc='vlc -I rc'

# ZShell Aliases

alias sz='source ~/.zshrc'
alias mvim='nocorrect mvim'

# Misc Aliases

alias ll="ls -al"
alias ls="ls -G"
alias p='cd ~/Projects/MOTECH/'
# alias ^L=clear

# Mongoose Web Server Alias
#alias mongoose="ip=`ifconfig ppp0 | grep inet | awk '{print $2}'` && url=\"http://$ip:8080\" && if [ $ip ]; then {print \"Web Server started with Document root at `pwd` At $url if I am on reliance Netconnect\nThis url is copied to clipboard as well\"} fi && if [ $ip ]; then {print $url} fi | pbcopy && nocorrect mongoose"

#alias mongoose="ip=`curl -s $IP_RESOLVER_URL;echo` && sleep 2 && url=\"http://$ip:8080\" && if [ $ip ]; then {print \"Web Server started with Document root at `pwd` \nAt $url \nIf this is not your public Ip then Go To Hell !!!\nThis url is copied to clipboard as well\"} fi && if [ $ip ]; then {print $url} fi | pbcopy && nocorrect mongoose"

# Aliases Copied from Somewhere .Not exactly sure what they do :P

alias slrn="slrn -n"
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias offlineimap-tty='offlineimap -u TTY.TTYUI'
alias hnb-partecs='hnb $HOME/partecs/partecs-hnb.xml'
alias rest2html-css='rst2html --embed-stylesheet --stylesheet-path=/usr/share/python-docutils/s5_html/themes/default/print. css'

#Postgres Jobs Alias
#
alias cronjob_psql='psql -U postgres -d motechquartz -c "SELECT qrtz_triggers.trigger_name, cron_expression, to_timestamp(next_fire_time/1000) as next, to_timestamp(prev_fire_time/1000) as prev, to_timestamp(start_time/1000) as start
 FROM qrtz_cron_triggers, qrtz_triggers WHERE qrtz_triggers.trigger_name = qrtz_cron_triggers.trigger_name order by qrtz_triggers.trigger_name;"'

alias repeatjob_psql='psql -U postgres -d motechquartz -c "SELECT qrtz_triggers.trigger_name, times_triggered, to_timestamp(next_fire_time/1000) as next, to_timestamp(prev_fire_time/1000) as prev, to_timestamp(start_time/1000) as start
  FROM qrtz_simple_triggers, qrtz_triggers WHERE qrtz_triggers.trigger_name = qrtz_simple_triggers.trigger_name order by qrtz_triggers.trigger_name;"'

alias jobsp='cronjob_psql;repeatjob_psql'
