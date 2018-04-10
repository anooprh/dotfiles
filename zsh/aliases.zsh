# SSH aliases

alias kill-all-ssh="ps -ef | grep 'ssh' | grep -v 'grep' | awk '{print $2}' | xargs kill -9"
alias ssh="ssh -o 'StrictHostKeyChecking no'"

# Git Aliases

alias gpom="git push -u origin master"
alias gs="git status"
alias g="git"
alias gp="git pull --rebase && git push"
alias gpr="git pull --rebase"
alias grh='git reset --hard'
alias gch='git checkout'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gk='gitk'
#alias gd='git diff --color'
alias st='stree'
alias gg='git gui'
alias gl="git log --oneline -10"
alias glcid="git log --oneline -1 | awk -F '' '{print $1}' | pbcopy"
alias gl6="git log --oneline -5"
alias gl3="git log --oneline -3"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --date=relative | less -R"
alias gpup='git pull && git submodule init && git submodule update && git submodule status'
alias gd='cd `git rev-parse --show-toplevel`'

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

alias vlc='vlc -I rc --vout none'

# ZShell Aliases

alias sz='source ~/.zshrc'
alias mvim='nocorrect mvim'

# Misc Aliases

alias ll="ls -alh"
alias ls="ls -G"
alias p='cd ~/Workspace'
alias xcopy="xclip -selection c"
# alias ^L=clear


alias ipaddr="curl ifconfig\.me/ip"
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

#Matlab launcher shortcut
alias matlab="~/Softwares/MATLAB/bin/matlab"

#File exlporer shortcut
#alias e="dolphin . 2>&1 >/dev/null &"

#Emacs alias
#alias e="/usr/local/Cellar/emacs/25.2/bin/emacsclient -c"
alias emacs="emacsclient -c"
