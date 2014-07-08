#!/bin/bash
#==============================================================================
#title           :install
#description     :This script will install all packages and register the profile setting properly.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash install.sh "dev"
#bash_version    :4.1.5(1)-release
#==============================================================================

set -e
environment="${1-"dev"}"

version="1.0"
export version

# deploy all dependent packages
. "$HOME/scripts/pre-release/deploy.sh" "${environment}"

# create profile link
rm -rf "$HOME/scripts/profile/current" 
ln -s "$HOME/scripts/profile/$version" "$HOME/scripts/profile/current"

# register profile scripts
grep -q ". ${HOME}/scripts/profile/current/setup.sh \"${environment}\"" $HOME/.profile || echo ". ${HOME}/scripts/profile/current/setup.sh \"${environment}\"" >> $HOME/.profile