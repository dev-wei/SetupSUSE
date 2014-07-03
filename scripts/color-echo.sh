#!/bin/bash
# color-echo.sh: Echoing text messages in color.

# Modify this script for your own purposes.
# It's easier than hand-coding color.

black='\E[30;47m'
red='\E[31;47m'
green='\E[32;47m'
yellow='\E[33;47m'
blue='\E[34;47m'
magenta='\E[35;47m'
cyan='\E[36;47m'
white='\E[37;47m'


alias Reset="tput sgr0"      #  Reset text attributes to normal
                             #+ without clearing screen.

cecho ()                     # Color-echo.
                             # Argument $1 = message
                             # Argument $2 = color
{
  message=$1                 # Defaults to default message.
  color=${2:-$black}         # Defaults to black, if not specified.

  echo -e "$color"
  echo "$message"
  Reset                      # Reset to normal.

  return
}  
