# .bash_profile
export SSH_AGENT_ENV_FILE=~/.ssh/agent_env

function start_ssh_agent () {
    echo "checking for ssh agent"
    SERVICE='ssh-agent'
    WHOAMI=$(whoami)
    
    CREATE_AGENT=0
    if [ -f ${SSH_AGENT_ENV_FILE} ]; then
        .  ${SSH_AGENT_ENV_FILE}
        kill -s 0 ${SSH_AGENT_PID} > /dev/null 2>&1
        if [ $? -ne 0  ]; then
            echo "No valid ssh-agent found"
            CREATE_AGENT=1
        fi
    else
        echo "No valid ssh-agent found"
        CREATE_AGENT=1
    fi
    if [ ${CREATE_AGENT} -ne 0 ]; then
        echo "Creating agent anew"
        killall ssh-agent > /dev/null 2>&1
        rm -rf ${SSH_AGENT_ENV_FILE}
        /usr/bin/ssh-agent > ${SSH_AGENT_ENV_FILE}
        . ${SSH_AGENT_ENV_FILE}
        ssh-add
        if [ -f ~/.ssh/ssh-us-west-2-dropbox.pem ]; then
            ssh-add -k ~/.ssh/ssh-us-west-2-dropbox.pem
        fi
        if [ -f ~/.ssh/us-east-1-terraform-keypair.pem ]; then
            ssh-add -k ~/.ssh/us-east-1-terraform-keypair.pem
        fi
        ssh-add -K
    else
        echo "Found an existing ssh-agent ${SSH_AGENT_PID}. nothing to do."
    fi
}

function start_ssh_agent_orig() {
    if pgrep -u $WHOAMI $SERVICE >/dev/null
    then
        echo "$SERVICE running." > /dev/null
    else
        echo "$SERVICE not running."
        rm -rf ${SSH_AGENT_ENV_FILE}
        /usr/bin/ssh-agent > ${SSH_AGENT_ENV_FILE}
    fi
    . ${SSH_AGENT_ENV_FILE}
}

export -f start_ssh_agent
#start_ssh_agent

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/maniyeda/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/maniyeda/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/maniyeda/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/maniyeda/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

