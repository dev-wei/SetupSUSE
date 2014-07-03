#!/bin/bash
#==============================================================================
#title           :setup-env
#description     :This script will invoke load-env or unload-env properly.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash setup_env.sh "Dev"
#bash_version    :4.1.5(1)-release
#==============================================================================
set -e
source "$HOME/scripts/color-echo.sh"

AllowedHosts=${AllowedHosts-"fraitcf1vd2382 USNYCWS596931"}
Version=${Version-"current"}
Environment=${1-"Dev"}

function load_env {
	echo "Load $1 environment on $HOSTNAME"
	. "$ENVY_ROOT_DIR/load_env.sh" $1
}

function unload_env {
	echo "Unload $1 environment on $HOSTNAME"
  . "$ENVY_ROOT_DIR/unload_env.sh" $1
}

function contains {
  for host in $1; do
    [[ $host = $2 ]] && return 0
  done
  return 1
}

ENVY_ROOT_DIR=$HOME/scripts/profile/$Version
export ENVY_ROOT_DIR
echo "Export ENVY_ROOT_DIR=$ENVY_ROOT_DIR"

if contains "$AllowedHosts" "$HOSTNAME"; then
	load_env $Environment
else
	cecho "ERROR !!!!!!! unknown box $HOSTNAME" $red
fi