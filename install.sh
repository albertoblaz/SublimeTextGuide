#!/bin/bash

# Author: Carlos David Rodríguez Peña (Garinoth)
# GitHub: https://github.com/Garinoth

###############################################################################
### GLOBAL VARIABLES ##########################################################
###############################################################################



###############################################################################

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
   -u      Uninstall
   -r      Reinstall
   -c      Install Package Control
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
    printf "$2... "
    if [[ $VERBOSE -eq 1 ]]; then
        eval $1
    else
        eval $1 &> /dev/null
    fi
    printf "Done\n"
}


# Apt-get Installation function. Adds the repository and installs either the 
# stable or development version
function install () {
    execute "add-apt-repository -y ppa:webupd8team/sublime-text-2" "Adding repository"
    execute "apt-get update" "Updating Libraries"

    if [[ $REINSTALL -eq 1 ]]; then
        uninstall
    fi

    if [[ $DEV -eq 1 ]]; then
        execute "apt-get install sublime-text-dev" "Installing sublime-text-2 development version"
    else
        execute "apt-get install sublime-text" "Installing sublime-text-2"
    fi

    if [[ $PC -eq 1 ]]; then
        execute "sudo -u $SUDO_USER wget -N -P $HOME/.config/sublime-text-2/Installed\ Packages http://sublime.wbond.net/Package%20Control.sublime-package" "Downloading Package Control"
    fi

    if [[ $PLUGINS -eq 1 ]]; then
        echo "TODO Install plugins"
    fi
}

# Uninstall function
function uninstall () {
    execute "apt-get -y remove sublime-text*" "Uninstalling sublime-text-2"
    execute "rm -r $HOME/.config/sublime-text-2" "Removing config, plugins, etc"
}

###############################################################################

###############################################################################
### MAIN EXECUTION ############################################################
###############################################################################

# Check optional parameters
while getopts "hvdurcp:" OPTION; do
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
        u)
            UNINSTALL=1
            ;;
        r)
            REINSTALL=1
            ;;  
        c)
            PC=1
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

# Check root permission
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: This script must be run as root"
    exit 1
fi

if [[ $UNINSTALL -eq 1 ]]; then
    uninstall
else
    install
fi
