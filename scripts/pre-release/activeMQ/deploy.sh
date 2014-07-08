#!/bin/bash
#==============================================================================
#title           :deploy
#description     :This script will deploy ActiveMQ.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash deploy.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

apps_folder="${apps_folder-"$HOME/apps/"}"

package_folder="$HOME/scripts/pre-release/activeMQ/"
activeMQ_version="5.5.0"
activeMQ_tar="$package_folder/apache-activemq-${activeMQ_version}-bin.tar.gz"
activeMQ_folder="${apps_folder}activeMQ/apache-activemq-${activeMQ_version}"

# unzipping activeMQ package"
tar -zxvf "${activeMQ_tar}"

# remove old activeMQ folder"
if [ -d "${activeMQ_folder}" ]; then
	rm -rf "${activeMQ_folder}"
fi

# move activeMQ folder to apps folder
mkdir -p "${activeMQ_folder}"
mv "apache-activemq-${activeMQ_version}" "${apps_folder}activeMQ/"

# create link of current
rm -rf "${apps_folder}activeMQ/current"
ln -s "${activeMQ_folder}" "${apps_folder}activeMQ/current"