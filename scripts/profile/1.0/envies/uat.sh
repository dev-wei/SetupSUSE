#!/bin/bash
#==============================================================================
#title           :uat
#description     :This script will load all profile setting for uat environment
#author			 :michael.wei
#date            :20140702
#version         :1.0    
#usage		 	 :bash uat.sh
#bash_version    :4.1.5(1)-release
#==============================================================================

# override the prompt color to yellow
export PBT_OVERRIDE_FG_COLOR=3

. "${ENVIES_DIR}/common.sh"