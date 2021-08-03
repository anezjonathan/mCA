sudo apt update
sudo apt purge nginx nginx-common -y
sudo apt autoremove
sudo rm -rf /etc/nginx