#!/bin/bash
#==============================================================================
#title           :deploy
#description     :This script will deploy all the dependent packages.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash deploy.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

environment="${1-"dev"}"
apps_folder="${apps_folder-"$HOME/apps/"}"
export apps_folder

if [ ! -d "${apps_folder}" ]; then
  # create target folder
  mkdir -p "${apps_folder}"
fi

. "${HOME}/scripts/pre-release/java/deploy.sh" $environment
. "${HOME}/scripts/pre-release/activeMQ/deploy.sh" $environment
. "${HOME}/scripts/pre-release/node/deploy.sh" $environment