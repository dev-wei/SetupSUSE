#!/bin/bash
#==============================================================================
#title           :common
#description     :This script will load all common profile setting 
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash common.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

if [ -d "${ENVY_ROOT_DIR}" ]; then
	echo "alias envy"
	grep -q "alias envy='cd ${ENVY_ROOT_DIR}'" $HOME/.bashrc || echo "alias envy='cd ${ENVY_ROOT_DIR}'" >> $HOME/.bashrc
fi

# set JAVA_HOME
JAVA_HOME="$HOME/apps/java/current"
if [ -d "${JAVA_HOME}" ]; then
	echo "export JAVA_HOME=${JAVA_HOME}"
	export JAVA_HOME
	PATH=$JAVA_HOME/bin:$PATH
fi

# set ActiveMQ
ACTIVE_MQ_HOME="$HOME/apps/activeMQ/current"
if [ -d "${ACTIVE_MQ_HOME}" ]; then
	echo "export ACTIVE_MQ_HOME=${ACTIVE_MQ_HOME}"
	export ACTIVE_MQ_HOME
	PATH=$ACTIVE_MQ_HOME/bin:$PATH
fi

# set Node Root
NODE_HOME="$HOME/apps/node/current"
if [ -d "${NODE_HOME}" ]; then
	echo "export NODE_HOME=${NODE_HOME}"
	export NODE_HOME
	PATH=$NODE_HOME/bin:$PATH

	NODE_MODULES_HOME="$NODE_HOME/current/lib/node_modules"
	echo "export NODE_MODULES_HOME=${NODE_MODULES_HOME}"
	export NODE_MODULES_HOME
	PATH=$NODE_MODULES_HOME:$PATH
fi

# workspace
WORKSPACE_DIR="$HOME/apps/dev"
mkdir -p "${WORKSPACE_DIR}"
echo "export WORKSPACE_DIR=${WORKSPACE_DIR}"
export WORKSPACE_DIR
grep -q "alias workspace='cd ${WORKSPACE_DIR}'" $HOME/.bashrc || echo "alias workspace='cd ${WORKSPACE_DIR}'" >> $HOME/.bashrc

# set bash prompt color and style
PBT_FG_COLOR=${PBT_OVERRIDE_FG_COLOR:-7}
export PS1='\[$(tput setaf $PBT_FG_COLOR)$(tput bold)\][${USER}][${MY_ENV}]@$HOST:$PWD\[$(tput sgr0)\] \$'

export TERM=xterm
export TMOUT=0
export VISUAL=vim

# alias ps='COLUMNS=2000 ps'

ulimit -c unlimited
# Set limit for number of open file handles to the hard limit
ulimit -Sn `ulimit -Hn`

# ##SET PUTTY COMMAND WINDOW###
# case "$TERM" in
# xterm*|rxvt*)
#   export PROMPT_COMMAND='echo -ne "\033]0;`hostname` `whoami`\007"'
#     ;;
# *)
#     ;;
# esac

