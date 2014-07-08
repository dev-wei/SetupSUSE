#!/usr/bin/env bash
#==============================================================================
#title           :load
#description     :This script loads up individual enviroments which are defined in the .env file of the user.
#author			 		 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 		 :bash load.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

set -e
source "$HOME/scripts/utilities/color_echo.sh"

export ENVIES_DIR="${ENVY_ROOT_DIR}/envies"

if [ $# -lt 1 ];
then
 
	echo "****************************************"
	echo "Warning! Environment has not been Loaded"
	echo "Incorrect Usage"
	echo "load.sh <environment1> <environment2> ..."
	echo "********LIST OF ENVIRONMENTS***********"

	cd "$ENVIES_DIR"
	ls -d -1 *.sh |sort |sed -e 's/\.sh//'|cut -d"/" -f9
	
  echo "****************************************"
	return 1
fi

# unset the prompt colours as it has to co work with unloadenv which sets prompt as red
unset WS_OVERRIDE_FG_COLOR

#Check if the files exists
for env_file in "$*";
do
	echo "$ENVIES_DIR/$env_file.sh" 
	if [ ! -e "$ENVIES_DIR/$env_file.sh" ]
  then
  	echo "*******************************************"
    echo "Warning! Environment File $env_file.sh is missing."
    echo "     Please check if present"
    echo "     Loading Environment $env_file Failed"
    echo "*******************************************"
    return 1
  fi
done

#Loop through the different environments and load them in order
for env in "$*";
do
	export WS_ENV=$env
	export MY_ENV=$env
	
	. "${ENVIES_DIR}/$env.sh"
done


