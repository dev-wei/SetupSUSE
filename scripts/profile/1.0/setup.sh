#!/bin/bash
#==============================================================================
#title           :setup
#description     :This script will invoke load-env or unload-env properly.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash setup.sh "Dev"
#bash_version    :4.1.5(1)-release
#==============================================================================
set -e
source "$HOME/scripts/utilities/color_echo.sh"

allowed_hosts="${allowed_hosts-"fraitcf1vd2382 USNYCWS596931"}"
version="${version-"1.0"}"
environment="${1-"dev"}"

function load_env {
	echo "Load $1 environment on $HOSTNAME"
	. "$ENVY_ROOT_DIR/load.sh" $1
}

function unload_env {
	echo "Unload $1 environment on $HOSTNAME"
  . "$ENVY_ROOT_DIR/unload.sh" $1
}

function contains {
  for host in $1; do
    [[ $host = $2 ]] && return 0
  done
  return 1
}

ENVY_ROOT_DIR="$HOME/scripts/profile/current"
export ENVY_ROOT_DIR

if contains "$allowed_hosts" "$HOSTNAME"; then
	load_env $environment
else
	cecho "ERROR !!!!!!! unknown box $HOSTNAME" $red
fi