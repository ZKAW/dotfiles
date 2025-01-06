#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

sudo apt update
sudo apt upgrade
sudo apt install -y python3.10 python3-pip
sudo apt install -y libsdl1.2-dev libsdl2-image-dev libsdl-image1.2 libsdl-ttf2.0-dev libsdl-mixer1.2
sudo apt install -y android-sdk
sudo apt install -y build-essential curl file git
sudo apt install -y snapd

# nodejs
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install -y nodejs
rm nodesource_setup.sh

# yarn
sudo npm install -g yarn

# zsh
sudo apt install -y zsh
sudo chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# golang
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz

# rust
sudo apt install -y cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome-stable_current_amd64.deb 
sudo apt install -f
rm google-chrome-stable_current_amd64.deb

# tmux
sudo apt install -y tmux

# vim & nvim
sudo apt install -y vim neovim

# docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce

# discord
sudo snap install discord

# spotify
sudo snap install spotify --classic

# themes
sudo apt install -y gnome-tweaks
sudo apt install -y gnome-shell-extensions
# note: install Audio Output Switcher, Blur my Shell, User Themes and Vitals
