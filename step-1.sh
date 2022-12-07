#! /bin/bash

waiting_now () {
  echo "Press any key to continue"
  while [ true ] ; do
  read -t 3 -n 1
  if [ $? = 0 ] ; then
  exit ;
  else
  echo "waiting for the keypress"
  fi
  done
}

sudo apt update
sudo apt upgrade -y
sudo apt install kubuntu-desktop -y
sudo apt install ansible firefox keepassxc rclone -y
sudo hostnamectl hostname nllt-100701
ssh-keygen -b 4096 
cat ~/.ssh/id_rsa.pub
mkdir ~/.config/rclone/ ~/googledrive/ ~/Documents/github/my-repos/
mv rclone.conf ~/.config/rclone/
rclone mount googledrive:backup ~/googledrive/
keepassxc ~/googledrive/keys/not-secrets.kbdx
firefox https://github.com/settings/keys https://accounts.google.com/login
waiting_now
cd ~/Documents/github/my-repos/
git clone git@github.com:brightly-ccv/driver-setup.git
cd driver-setup
ansible-playbook --connection=local -i localhost, -bK driver-setup.yml