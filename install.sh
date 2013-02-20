#!/bin/bash

# Author: Carlos David Rodríguez Peña (Garinoth)
# GitHub: https://github.com/Garinoth

###############################################################################
### FUNCTIONS #################################################################
###############################################################################

# Help function
function usage () {
cat << EOF

This script will install the program sublime-text-2

OPTIONS:
   -h      Show this message
   -v      Verbose
   -d      Install development version
   -c      Install Package Control
   -u      Uninstall
   -p      Install the plugin set

EOF
}


# Log function. Only works if the verbose option is selected
function log () {
    if [[ $VERBOSE -eq 1 ]]; then
        echo "$@"
    fi
}

# Function that executes the given code checking the verbose option
function execute () {
    printf "$2..."
    if [[ $VERBOSE -eq 1 ]]; then
        $1
    else
        $1 &> /dev/null
    fi
    printf "Done\n"
}


# Apt-get Installation function. Adds the repository and installs either the 
# stable or development version
function install () {
    execute "add-apt-repository -y ppa:webupd8team/sublime-text-2" "Adding repository"
    execute "apt-get update" "Updating Libraries"

    if [[ $DEV -eq 1 ]]; then
        echo
    fi
}

# Uninstall function
function uninstall () {
    echo "TODO uninstall"
}

###############################################################################

###############################################################################
### MAIN EXECUTION ############################################################
###############################################################################

# Check root permission
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: This script must be run as root"
    exit 1
fi

# Check optional parameters
while getopts "hvdcup:" OPTION; do
    case $OPTION in
        h)
            usage
            exit 1
            ;;
        v)
            VERBOSE=1
            ;;
        d)
            DEV=1
            ;;
        c)
            PC=1
            ;;
        u)
            uninstall
            exit 0
            ;;
        p)
            PLUGINS=1
            ;;
        ?)
            echo "Invalid option: -$OPTION" >&2
            usage
            exit 1
            ;;
        :)
            echo "Option -$OPTION requires an argument." >&2
            exit 1
            ;;
    esac
done

install

#file=$(zenity --list --width=360 --height=320 --title "Lanzador" \
#    --column="a" --column="Acciones" --checklist \
#    FALSE "Abrir Gedit" \
#    FALSE "Abrir carpeta Música" \
#    TRUE "Ir a LinuxZone")

#echo $file

# Add the repository and update
#add-apt-repository ppa:webupd8team/sublime-text-2
#apt-get update

# Messy fast way of purging the repository before install
#sudo apt-get remove sublime-text*

# Install sublime-text-2
#apt-get install sublime-text

# Optionally install the development package
#apt-get install sublime-text-dev

# Package control
# http://sublime.wbond.net/Package%20Control.sublime-package