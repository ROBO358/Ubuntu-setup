#!/bin/sh



cd "dirname $0"

echo "SETUP Starting..."
sudo apt update
sudo apt -y upgrade
sudo apt -y install vim git zsh curl

sudo apt -y autoremove
sudo apt -y autoclean

echo "Git Settings"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global core.editor vim
git config --global user.name $1
git config --global user.email $2
git config -l

cp -f -b ./bin/.p10k.zsh ./bin/.zshrc $HOME
chsh -s $(which zsh)
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
mkdir font
curl -sSL https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o ./font/MesloLGS_NF_Regular.ttf
echo "Done"

echo "======"
echo "SET ./font/MesloLGS_NF_Regular.ttf TO THE DEFAULT FONT OF THE TERMINAL."
echo "AND REBOOT."
