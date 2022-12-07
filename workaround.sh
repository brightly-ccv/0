#! /bin/bash
# because vagrant gets stuck on enfcfs withing kubuntu-desktop install
# sudo apt install sudo 
# get the pid
sudo kill -9 $1
sudo apt install kubuntu-desktop -y
sudo dpkg --configure -a
sudo reboot now
