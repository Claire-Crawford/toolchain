#!/bin/sh

# 'windscribe.sh'

# by David Lynn Skinner
# on May 11, 2021
# for Davsk Ltd Co

# Excerpts from: https://windscribe.com/guides/linux#how-to

read -p "Do you have an account with Windscribe?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]] then 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
sudo apt-get update
sudo apt-get install windscribe-cli
windscribe login
windscribe connect
fi
