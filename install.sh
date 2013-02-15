#!/bin/bash

# Help function
usage() {
    echo :p
cat << EOF
This script will install the program sublime-text-2

OPTIONS:
   -h      Show this message
   -d      Install development version
   -v      Verbose
EOF
}

set_options() {
while getopts “ht:r:p:v” OPTION
do
     case $OPTION in
         h)
             usage
             exit
             ;;
         v)
             VERBOSE=1
             ;;
         ?)
             usage
             exit
             ;;
     esac
done
}

set_options
# Add the repository and update
#add-apt-repository ppa:webupd8team/sublime-text-2
#apt-get update

# Messy fast way of purging the repository before install
#sudo apt-get remove sublime-text*

# Install sublime-text-2
#apt-get install sublime-text

# Optionally install the development package
#apt-get install sublime-text-dev
