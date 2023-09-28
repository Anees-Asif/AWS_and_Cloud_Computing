#!/bin/bash
# Update
sudo apt update
# Upgrade
sudo apt upgrade -y
# Install nginx
sudo apt install nginx -y
# Restart nginx
sudo systemctl restart nginx
# Enable nginx
sudo systemctl enable nginx

# Clone the GitHub repo
git clone https://github.com/LSF970/sparta_test_app.git

# Install Node.js
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
sudo apt install nodejs -y

# Install PM2 globally
sudo npm install pm2 -g

# Change directory to the cloned repo
cd sparta_test_app
cd app

# Install project dependencies
npm install

# Start your Node.js application
node app.js
