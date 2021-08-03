DOMAIN=example.com

sudo apt update
sudo apt upgrade
sudo apt autoremove
sudo apt install nginx nginx-common -y

sudo cp -f nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp -rf nginx/django /etc/nginx/

sed -e "s/{{ DOMAIN }}/$DOMAIN/" nginx/sites-available/django.conf > nginx/sites-available/$DOMAIN.conf

sudo cp -f nginx/sites-available/$DOMAIN.conf /etc/nginx/sites-available/$DOMAIN.conf
sudo ln -fs /etc/nginx/sites-available/$DOMAIN.conf /etc/nginx/sites-enabled/$DOMAIN.conf

cd ../MakeCA
sudo make dh
sudo make quick FQDN=$DOMAIN

sudo nginx -t
sudo service nginx restart