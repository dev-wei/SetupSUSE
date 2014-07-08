#!/bin/bash
#==============================================================================
#title           :deploy
#description     :This script will deploy Node.
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash deploy.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

apps_folder="${apps_folder-"$HOME/apps/"}"

package_folder="$HOME/scripts/pre-release/node/"
node_version="0.10.29"
node_tar="$package_folder/node-v${node_version}-linux-x64.tar.gz"
node_folder="${apps_folder}node/node-v${node_version}-linux-x64"

# unzipping node package"
tar -zxvf "${node_tar}"

# remove old node folder"
if [ -d "${node_folder}" ]; then
	rm -rf "${node_folder}"
fi

# move node folder to apps folder
mkdir -p "${node_folder}"
mv "node-v${node_version}-linux-x64" "${apps_folder}node/"

# create link of current
rm -rf "${apps_folder}node/current"
ln -s "${node_folder}" "${apps_folder}node/current"