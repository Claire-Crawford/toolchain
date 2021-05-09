#!/bin/bash

# 'toolchain.sh'

# by David Skinner
# on May 8, 2021
# for Davsk Ltd Co

# Copyright (c) 2021 Davsk Ltd Co. All Rights Reserved

# This script installs the Davsk Toolchain on Ubuntu 21.04

OS_ID=$(cat /etc/os-release | grep '^ID=' | cut -d'=' -f2 )
echo $OS_ID

case $OS_ID in
  ubuntu)
    echo "Installing Davsk Toolchain on Ubuntu."
    ;;
  *)
    echo "OS Release ID $OS_ID not recognized!"
    exit 1
    ;;
esac

# Updates
sudo apt-get update
sudo apt-get -y upgrade

# linuxbrew
sudo apt-get install build-essential procps curl file git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# shellcheck disable=SC2016
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/david/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc
brew install gh
brew install sass/sass/sass

# chrome
sudo apt-get install gdebi-core wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi google-chrome-stable_current_amd64.deb

# tools
sudo apt-get install zsh go gitkraken julia cmake umbrello
sudo apt-get install hugo goland emacs
sudo apt-get install gimp inkscape cherrytree 

# ssh
read -rp "Enter your email: " email
ssh-keygen -t ed25519 -C "$email"
eval 'ssh-agent -s'
ssh-add ~/.ssh/id_ed25519

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "~/.ssh/id_ed25519 needs to be added to GitHub.com account"
