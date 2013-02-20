#!/bin/bash

# Help function
usage() {
cat << EOF

This script will install the program sublime-text-2

OPTIONS:
   -h      Show this message
   -d      Install development version
   -v      Verbose

EOF
}

# Log function. Only works if the verbose option is selected
function log () {
    if [[ $VERBOSE -eq 1 ]]; then
        echo "$@"
    fi
}

# Check optional parameters
while getopts "hvd" OPTION; do
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

log "Alberto es tontooooooooooo"

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