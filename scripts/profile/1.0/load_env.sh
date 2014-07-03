#!/usr/bin/env bash
#==============================================================================
#title           :load_env
#description     :This script loads up individual enviroments which are defined in the .env file of the user.
#author			 		 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 		 :bash load_env.sh
#bash_version    :4.1.5(1)-release
#==============================================================================
set -e
source "$HOME/scripts/color-echo.sh"

export ENVIES_DIR="${ENVY_ROOT_DIR}/envies"

if [ $# -lt 1 ];
then
	USAGE="load_env.sh <environment1> <environment2> ..."
   
	echo "****************************************"
	echo "Warning! Environment has not been Loaded"
	echo "Incorrect Usage"
	echo $USAGE
	echo "********LIST OF ENVIRONMENTS***********"
	cd "$ENVIES_DIR"
	ls -d -1 *.env |sort |sed -e 's/\.env//'|cut -d"/" -f9
	echo "****************************************"
	return 1
fi

echo "*******************************************"

# unset the prompt colours as it has to co work with unloadenv which sets prompt as red
unset WS_OVERRIDE_FG_COLOR

#Check if the files exists
for envFile in $*;
do
	if [ ! -e $ENVIES_DIR/$envFile.env ]
  then
    echo "Warning! Environment File $envFile.env is missing."
    echo "     Please check if present"
    echo "     Loading Environment $envFile Failed"
    echo "*******************************************"
    return 1
  fi
done

#Loop through the different environments and load them in order
while [ "$*" != "" ];
do
env=$1

echo "     Loading Environment $env..."

environmentFile="${ENVIES_DIR}/$env.env"

    if [ ! -e $environmentFile ]
    then
      echo "     Can't find environment definition file $env.env"
      echo "     Loading Environment $EnvFile Failed"
      echo "*******************************************"
      return 1
    else
        export WS_ENV=$env
	echo $WS_ENV
        . $environmentFile
	# override with home directory envy file
	if [  -e ~/.envy/$envFile.env ]
        then
                echo "Overriding with ~/.envy/$envFile.env "
                . ~/.envy/$envFile.env
        fi

     fi
    shift
done