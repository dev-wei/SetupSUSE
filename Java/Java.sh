#!/bin/bash


AppsFolder="${AppsFolder=$HOME/apps/}"
TargetFolder="${AppsFolder}Java/"
set -o dev
  JavaVersion="jdk1.7.0"
set +o dev
  JavaVersion="jre1.7.0"

echo $AppsFolder
echo $JavaVersion
<<1
if [ ! -d "${TargetFolder}" ]; then
  echo "Create target folder at ${TargetFolder}"
  mkdir -p "${TargetFolder}"
fi

echo "Unzip Java Runtime starts."
tar -zxvf "${JavaVersion}.gz"
echo "Unzip Jave Runtime completed."

if [ -d "${TargetFolder}${JavaVersion}" ]; then
  echo "Remove Java folder at " + "${TargetFolder}${JavaVersion}"
  rm -rf "${TargetFolder}${JavaVersion}"
fi

echo "Move Java Runtime folder to apps folder"
mv "${JavaVersion}" "${TargetFolder}"

echo "Create a link"
rm -f "${TargetFolder}current"
ln -s "${TargetFolder}${JavaVersion}/" "${TargetFolder}current"

echo "Finished installing Java Runtime $JavaVersion at $TargetFolder"
1
