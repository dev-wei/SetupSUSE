#!/bin/bash
#==============================================================================
#title           :deploy
#description     :This script will deploy java.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash deploy.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

environment="${1-"dev"}"
apps_folder="${apps_folder-"$HOME/apps/"}"
package_folder="${HOME}/scripts/pre-release/java/"

if [ "${environment}" == "dev" ]; then
	java_version="jdk1.7.0_60"
else
	java_version="jre1.7.0"
fi

java_folder="${apps_folder}java/${java_version}"
java_tar="$package_folder$java_version.gz"

# unzipping Java package"
tar -zxvf "${java_tar}"

# remove old Java folder"
if [ -d "${java_folder}" ]; then
	rm -rf "${java_folder}"
fi

# move Java folder to apps folder
mkdir -p "${java_folder}"
mv "${java_version}" "${apps_folder}java/"

# # create link of current
rm -rf "${apps_folder}java/current"
ln -s "${java_folder}" "${apps_folder}java/current"