cd /etc

cd nginx

cd sites-available

sudo nano default



sudo apt install sed

sudo sed -i "s/try_files \$uri \$uri\/ =404;/proxy_pass http:\/\/localhost:3000\/;/" /etc/nginx/sites-available/default       - Go into file specified and replace a certain line with the line we want.