# .bashrc

echo "Running bashrc"

#Also check ~/.bashrc_custom for more options specific to this machine

export HOME_DIR=${HOME}

# Source global definitions
#Also check ~/.bashrc_custom for more options specific to this machine
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

if [ -f /etc/profile ]; then
   . /etc/profile
fi

case "$(uname -s)" in
   Darwin)
     export os='mac'
     export OS='mac'
     ;;
   Linux)
     export os='linux'
     export OS='linux'
     ;;
esac


if [ $os == 'mac' ]; then
 defaults write com.apple.finder AppleShowAllFiles YES.
fi

set_iterm_name() {
    mode=$1; shift
    echo -ne "\033]$mode;$@\007"
}

iterm_both () { set_iterm_name 0 $@; }
iterm_tab () { set_iterm_name 1 $@; }
iterm_window () { set_iterm_name 2 $@; }

get_git_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

get_perl_pwd() {
    perl -pl0 -e "s|^${HOME}|~|;s|([^/])[^/]*/|$""1/|g" <<< ${PWD} |  tr '\0' '\n'
}

parse_git_branch() {
      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

short_pwd() {
    #No longer used. using get_perl_pwd instead
cwd=$(pwd)

if [ $cwd == $HOME ]; then echo -n "~"; return; fi
if [ $cwd == "/" ]; then echo -n "/"; fi

for l in $(echo $cwd | tr "/" "\n"); do
    echo -n "/"
    echo -n ${l:0:1}
done
echo -n ${l:1}
}

function pathmunge() {
    if ! echo $PATH | grep -q -e "(^|:)$1($|:)" ; then
        if [ $# -ge 1 ]; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
    fi
}


#same functionality as pathmunge
pathadd() {
    newelement=${1%/}
    if [ -d "$1" ] && ! echo $PATH | grep -E -q "(^|:)$newelement($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH="$PATH:$newelement"
        else
            PATH="$newelement:$PATH"
        fi
    fi
}

pathrm() {
    PATH="$(echo $PATH | sed -e "s;\(^\|:\)${1%/}\(:\|\$\);\1\2;g" -e 's;^:\|:$;;g' -e 's;::;:;g')"
}

GREEN="\[\e[32;1m\]"
YELLOW="\[\e[33;1m\]"
BLUE="\[\e[34;1m\]"
MAGENTA="\[\e[35;1m\]"
CYAN="\[\e[39;1m\]"
#CYAN=""
LIGHT="\[\e[96;1m\]"
RED="\[\e[31;1m\]"
WHITE="\[\e[97;1m\]"
BLACK="\[\e[30;1m\]"

case "$-" in
*i*) RESET="\[$(tput sgr0)\]";;
*)	RESET="";;
esac
# Used in prompt
export BOX_NAME='NONE'
export PROMPT_DATA=''

function apply_prompt() {
    #PS1=''
    #PS1="${CYAN}[${BLUE}${BOX_NAME} ${RED}\u@${MAGENTA}\h ${BLUE}\w${GREEN}${PROMPT_DATA:- }${MAGENTA}(\$(get_git_branch))${MAGENTA} \#${MAGENTA}${CYAN}]${RESET}\[\e[0m\]${RESET}"
    #PS1="${CYAN}[${MAGENTA}${BOX_NAME} ${RED}shyam ${BLUE}\w${GREEN} ${PROMPT_DATA:- }${MAGENTA}(\$(get_git_branch))${MAGENTA} \#${MAGENTA}${CYAN}]${RESET}\[\e[0m\]${RESET}"
    #PS1="${CYAN}[${MAGENTA}${BOX_NAME} ${RED}shyam ${BLUE}\$(short_pwd) ${GREEN} ${PROMPT_DATA:- }${MAGENTA}(\$(get_git_branch))${MAGENTA} \#${MAGENTA}${CYAN}]${RESET}\[\e[0m\]${RESET}"
    PS1="${CYAN}[${MAGENTA}${BOX_NAME} ${RED}\u ${BLUE}\$(get_perl_pwd)${GREEN} ${PROMPT_DATA:- } ${MAGENTA}(\$(get_git_branch))${MAGENTA} \#${MAGENTA}${CYAN}]${RESET}\[\e[0m\]${RESET}"
    export PS1
}

apply_prompt ''

#Setup Path
PATH=/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin/:/sbin:/bin
export PATH
pathmunge ~/bin
pathmunge ~/pbin
pathmunge ~/local_bin
pathmunge .
pathmunge /usr/local/go/bin after
export PATH

export html=/var/www/html
export js=/var/www/html/js
export nginx=/usr/local/etc/nginx/servers
export ng=/usr/local/etc/nginx/servers
export nglogs=/usr/local/var/log/nginx
export sup=/etc/supervisor/conf.d
export devel=${HOME}/devel
export JENKINS=/var/lib/jenkins
export jenkins=/var/lib/jenkins
export sc=~/.ssh/config

#####################################################333
#Functions Follow
#####################################################333

function up() {
    for i in `seq 1 $1`;
        do
            cd ../
        done;
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}
env_airflow() {
export app=${HOME_DIR}/devel/python/airflow-tutorial
export s=${app}
export APP_ROOT=${app}
PROMPT_DATA=" AIRFLOW "
export PROMPT_DATA
apply_prompt ${PROMPT_DATA}
cd $app
. env/bin/activate
export PYTHONPATH=$app
export ipy=${HOME}/.ipython/profile_default/startup/startup.py 
export AIRFLOW_HOME=${app}/airflow_home
}

env_python() {
export app=${HOME_DIR}/devel/python/oreos-flask
export s=${app}
export APP_ROOT=${app}
export pl=${HOME_DIR}/devel/python/python-learn
PROMPT_DATA=" PYTHON-OREOS "
export PROMPT_DATA
apply_prompt ${PROMPT_DATA}
cd $app
. env/bin/activate
export PYTHONPATH=$app
export ipy=${HOME}/.ipython/profile_default/startup/startup.py 
}

env_mean() {
export app=${HOME}/devel/nodejs/node-webpack-starter
export PROMPT_DATA='MEAN_STACK'
apply_prompt ${PROMPT_DATA}
cd $app
}

function env_nodejs() {
export app=${HOME}/devel/playground/nodejs/p3
export s=${HOME}/devel/playground/nodejs/p3
export PROMPT_DATA='NODEJS'
apply_prompt ${PROMPT_DATA}
cd $app
npm bin
export PATH=$(npm bin):${PATH}
}

set_java_version() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
}

env_nvm() {
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
}

npm-do() {
    (PATH=$(npm bin):$PATH; eval $@;)
}

nn() {
    (PATH=$(npm bin):$PATH; eval $@;)
}

function env_common() {
export node=${HOME}/devel/playground/nodejs
export py=${HOME}/devel/playground/python
}

gitd() {
    git log --pretty=format:'%h - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit $1...$2 
}

git_diff_previous() {
    git diff HEAD^ -- $1
}

function myip ()
{
    # Dumps a list of all IP addresses for every device
    # /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

    # Internal IP Lookup
    echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

    # External IP Lookup
    echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}

###############################################
#Functions end
###############################################

export -f pathmunge
export -f apply_prompt
export -f get_git_branch
export -f gitd
export -f git_diff_previous
export -f myip
export -f env_python

set -o vi

set editing-mode vi
set keymap vi
set convert-meta on

#declare -pf # See all defined functions.

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Make vim the default editor.
export EDITOR='vim';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

HISTCONTROL=ignoreboth

ulimit -S -c 0      # Don't want coredumps.
set -o notify
set -o noclobber
set -o ignoreeof

IGNOREEOF=1

# auto-completion of environment variables
# dont want the $ to be prepended by a \
# following 2 lines help with that...
shopt -s cdable_vars
#complete -v -F _cd $nospace $filenames cd


############## INPUT ################

#include dotfiles in wildcard expansion, and match case-insensitively
shopt -s dotglob
shopt -s nocaseglob

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable options:
# https://www.computerhope.com/unix/bash/shopt.htm
# `shopt -p` or `shopt -s` to print all options
shopt -s cdspell # correct minor spelling errors in cd
shopt -s cdable_vars # for `cd arg`, if the directory arg is missing, try doing cd ${arg}
#shopt -s checkjobs # list any running background jobs while exiting the shell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Add colors for manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Start an HTTP server from a directory, optionally specifying the port
http_server() {
    local port="${1:-2000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # Set the default Content-Disposition to `inline` so that files are displayed instead of downloaded.
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";Content-Disposition=inline;" + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Syntax-highlight JSON strings or files
# Usage: `jsonify '{"foo":42}'` or `echo '{"foo":42}' | json`
jsonify() {
    if [ -t 0 ]; then # argument
        python -mjson.tool <<< "$*" | pygmentize -l javascript;
    else # pipe
        python -mjson.tool | pygmentize -l javascript;
    fi;
}


export EMOJIS=('🌄' '☀️' '☕️' '🍳' '🍞' '🐓' '🐔' '🌲' '🌳' '🌴' '🌵' '🌷' '🌺' '🌸' '🌹' '🌻' '🌼' '💐' '🌾' '🌿' '🍀' '🍁' '🍂' '🍃' '🍄' '☀️' '⛅️' '☁️' '☔️' '🌈' '🌊' '🗻' '🌍' '🌞' '💻' '🚽' '📚' '✂️' '🔪' '🍔' '🍕' '🍖' '🍗' '🍘' '🍙' '🍚' '🍛' '🍜' '🍝' '🍞' '🍟' '🍣' '🍤' '🍥' '🍱' '🍲' '🍳' '🍴' '🍏' '🍇' '🍉' '🍊' '🍌' '🍍' '🍑' '🍒' '🍓' '🍡' '🍢' '🍦' '🍧' '🍨' '🍩' '🍪' '🍫' '🍬' '🍭' '🍮' '🍰' '🍷' '🍸' '🍶' '🍹' '🍺' '🍻' '😴' '🌠' '🌑' '🌒' '🌔' '🌖' '🌘' '🌚' '🌝' '🌛' '🌜' '⛺️' '🌃' '🌉' '🌌');

random_emoji() {
  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
  echo $SELECTED_EMOJI;
}


pidportfunction() {
    lsof -n -i4TCP:$1 | grep LISTEN
}

alias pidport=pidportfunction
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#required for some pip install errors for uwsgi and few other packages
export CFLAGS="-Wno-error=varargs"
export b=~/.bashrc
export bc=~/.bashrc_custom
export a=~/.aliases
export v=~/.vimrc
export DOCKER_BASE_DIR=${HOME}/devel/docker-volumes
pathmunge ${HOME}/devel/golang/bin after
[ -f $HOME/.aliases ] && . $HOME/.aliases
[ -f $HOME/.bashrc_custom ] && . $HOME/.bashrc_custom
[ -f $HOME/.credentials ] && . $HOME/.credentials
[ -f $HOME/.fzf.bash ] && . $HOME/.fzf.bash
