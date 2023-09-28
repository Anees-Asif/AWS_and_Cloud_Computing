Nodejs operates on port 3000 (usually)

Front page, posts page

What does our instance require in order to run the app?
* Linux vm running ubuntu 18.04
* Web server
* Right version of Node js - 12
* The app code itself
* In the app folder, we need to run 2 commands:

**npm install**

**node app.js**

## Setting up Nodejs

`curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -` - Getting a particular version of nodejs

`sudo apt install nodejs -y` - Installs the version you selected earlier.

`sudo npm install pm2 -g` - NPM = Node package manager. PM2 is a manager for node processes.

## Deploying

`npm install` - Bundle up for everything for nodejs

`node app.js` - Starts the app.


