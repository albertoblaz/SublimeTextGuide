#!/bin/bash

# Add the repository and update
add-apt-repository ppa:webupd8team/sublime-text-2
apt-get update

# Messy fast way of purging the repository before install
#sudo apt-get remove sublime-text*

# Install sublime-text-2
apt-get install sublime-text

# Optionally install the development package
#apt-get install sublime-text-dev