#! /bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install kubuntu-desktop
sudo apt install ansible firefox keepassxc -y
sudo hostnamectl hostname nllt-100701
ssh-keygen -b 4096
cat ~/.ssh/id_rsa.pub
firefox https://github.com/settings/keys
mkdir ~/Documents/github/my-repos/
cd ~/Documents/github/my-repos/
git clone git@github.com:brightly-ccv/driver-setup.git
cd driver-setup
ansible-playbook --connection=local -i localhost, -bK driver-setup.yml
