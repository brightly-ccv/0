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
mkdir ~/.config/rclone/ ~/googledrive/ ~/Documents/github/my-repos/
gpg --output rclone.conf -d rclone.conf.gpg 
mv rclone.conf ~/.config/rclone/
sudo snap install firefox 
sudo apt install ansible keepassxc rclone -y
sudo hostnamectl hostname nllt-100701
export -n SESSION_MANAGER
ssh-keygen -b 4096 
cat ~/.ssh/id_rsa.pub
rclone mount googledrive:backup ~/googledrive/ --allow-non-empty &
firefox https://github.com/settings/keys https://accounts.google.com/login &
wait 3
keepassxc ~/googledrive/keys/not-secrets.kbdx
cd ~/Documents/github/my-repos/
git clone git@github.com:brightly-ccv/driver-setup.git
cd driver-setup
ansible-playbook --connection=local -i localhost, -bK driver-setup.yml
