# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

if [ -f /etc/profile ]; then
   . /etc/profile
fi

pathmunge () {
    if ! echo $PATH | /usr/bin/egrep -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
       else
          PATH=$1:$PATH
       fi
    fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#GREEN="\[$(tput setaf 2)\]"
GREEN="\[\e[32;1m\]"
YELLOW="\[\e[33;1m\]"
BLUE="\[\e[34;1m\]"
MAGENTA="\[\e[35;1m\]"
CYAN="\[\e[36;1m\]"
LIGHT="\[\e[96;1m\]"
RED="\[\e[31;1m\]"
WHITE="\[\e[97;1m\]"
BLACK="\[\e[30;1m\]"
RESET="\[$(tput sgr0)\]"

function apply_prompt() {
PRE_PROMPT='\[\e[31;1m\] '
#POST_PROMPT=' \u@\h \w \#>\[\e[0m\]'
POST_PROMPT='MACBOOK \#>\[\e[0m\]'
TMP_PROMPT_DATA=$1
PS1=${PRE_PROMPT}${TMP_PROMPT_DATA}${POST_PROMPT}
}

# User specific aliases and functions
#PS1="\[\e[31;1m\] \u@\h \w ${GREEN} $(parse_git_branch) ${RESET} \#>\[\e[0m\]"
PS1="${YELLOW}!! ${RESET}${RED}\u@${RESET}${MAGENTA}\h${RESET} ${BLUE}\w${RESET}${GREEN}\$(parse_git_branch) ${RESET}\#>\[\e[0m\]"

# auto-completion of environment variables
# dont want the $ to be prepended by a \
# following 2 lines help with that...
shopt -s cdable_vars
#complete -v -F _cd $nospace $filenames cd

export PS1

PROMPT_DATA=''
export PROMPT_DATA

pathmunge /Applications/Postgres.app/Contents/Versions/latest/bin  after
pathmunge ~/bin before

export SVN_EDITOR=vi
export HOME_DIR=/Users/shyammaniyedath

export music=${HOME_DIR}/music
export photos=${HOME_DIR}/photos/new-camera
export html=/var/www/html
export js=/var/www/html/js
export devel=${HOME_DIR}/devel

function env_java8() {

export JAVA_HOME=${devel}/java/jdk/jdk1.7.0_79
export java=${devel}/java/jdk/jdk1.7.0_79
export j=${devel}/java

env_java_common
PROMPT_DATA="${PROMPT_DATA} JAVA7"
export PROMPT_DATA
apply_prompt ${PROMPT_DATA}
}

function env_java7() {

export JAVA_HOME=${devel}/java/jdk/jdk1.7.0_79
export java=${devel}/java/jdk/jdk1.7.0_79
export j=${devel}/java

env_java_common
PROMPT_DATA="${PROMPT_DATA} JAVA7"
export PROMPT_DATA
apply_prompt ${PROMPT_DATA}
}

function env_java_common {

export ANT_HOME=${devel}/java/apache-ant-1.9.2
export MAVEN_HOME=${devel}/java/apache-maven-3.0.5
export M2_HOME=${devel}/java/apache-maven-3.0.5
export maven=${devel}/java/apache-maven-3.0.5
export repo=${HOME_DIR}/devel/java/maven-repository

export XMLBEANS_HOME=${devel}/java/xmlbeans-2.4.0
export ant=${devel}/java/apache-ant-1.7.1

export HBASE_HOME=${devel}/java/hbase-0.92.1

pathmunge . before
pathmunge ${JAVA_HOME}/bin after
pathmunge ${JAVA_HOME}/jre/bin after
pathmunge ${ANT_HOME}/bin after
pathmunge ${XMLBEANS_HOME}/bin after
pathmunge ${MAVEN_HOME}/bin after
pathmunge ${HBASE_HOME}/bin after

export ECLIPSE=${devel}/java/eclipse
export ECLIPSE_DIR=${devel}/java/eclipse
export eclipse=${devel}/java/eclipse
export ECLIPSE_HOME=${devel}/java/eclipse

export CATALINA_HOME=${devel}/java/apache-tomcat-7.0.40
export tomcat=${CATALINA_HOME}
export CLASSPATH=.
}

function env_java() {
env_java8
}

function env_heroku_common() {
env_java8
env_git
export HEROKU_HOME=${devel}/heroku/heroku-client
export heroku=${devel}/heroku/

pathmunge ${HEROKU_HOME}
pathmunge ${HEROKU_HOME}/bin
PS1='\[\e[31;1m\] HEROKU \u@\h \w \#>\[\e[0m\]'
}


function env_heroku() {
env_heroku_common
export app=${HOME_DIR}/devel/heroku/multi-module/embarkk/webapp

PS1='\[\e[31;1m\] HEROKU EMBARKK \u@\h \w \#>\[\e[0m\]'

}

export -f pathmunge
export -f env_java

set -o vi

. ~/.aliases

r=~/quad/repo
export r

function env_hadoop() {
HD_HOME=~/quad/hd
HADOOP_HOME=~/quad/hd/hadoop
hadoop=~/quad/hd/hadoop
HBASE_HOME=~/quad/hd/hbase
hbase=~/quad/hd/hbase

export HD_HOME HADOOP_HOME HBASE_HOME hadoop hbase
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HBASE_HOME/bin
export HADOOP_INSTALL=$HADOOP_HOME
}

export -f env_hadoop

function env_quad() {
ng=/usr/local/etc/nginx/conf.d
ui=/Users/shyammaniyedath/quad/repo/quad-ui
schema=/Users/shyammaniyedath/quad/repo/quad-cmp/quad-cmp-application/src/main/resources/schema
v3=/Users/shyammaniyedath/quad/repo/quad-cmp
cmp=/Users/shyammaniyedath/quad/repo/quad-cmp
pa=/Users/shyammaniyedath/quad/repo/personal-admin-tools
deploy=/Users/shyammaniyedath/quad/repo/quad-code-deploy
ext=/Users/shyammaniyedath/quad/repo/quad-extraction-services
batch=/Users/shyammaniyedath/quad/repo/quad-batch
node=/Users/shyammaniyedath/quad/repo/quad-node-api
pg=/Applications/Postgres.app/Contents/Versions/9.5/bin
ph=/Users/shyammaniyedath/quad/hd/phoenix/bin
hb=/Users/shyammaniyedath/quad/hd/hbase/bin

SPARK_HOME=/Users/shyammaniyedath/quad/hd/spark/spark-1.6.2-bin-hadoop2.6
#PYTHONPATH=/Users/shyammaniyedath/quad/hd/spark/spark-1.6.2-bin-hadoop2.6/python/:
PATH=${SPARK_HOME}/bin:${SPARK_HOME}/sbin:$PATH

export SPARK_HOME
#export PYTHONPATH
export PATH
}

export -f env_quad

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

pathmunge . before

env_quad
env_hadoop
pathmunge . before
