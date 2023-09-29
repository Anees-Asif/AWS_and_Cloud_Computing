## Set up nginx and deploying our app
Due to us already making a script, we can use:

 ` scp -i "C:/Users/Anees/.ssh/tech254.pem" -r "C:\Users\Anees\AWS_and_Cloud_Computing\scripts\auto_deploy.sh" ubuntu@ec2-34-246-184-57.eu-west-1.compute.amazonaws.com:~
`
This will send our script to the server.

Then ssh into the server, and make the script an executable using: `sudo chmod +x auto_deploy.sh` and execute it using `./auto_deploy.sh`. We should now have an ec2 instance running nginx with our Nodejs app deployed.

## Setting up reverse proxy

First we need to navigate to the configuration file so we can define the reverse proxy settings. We can achieve this by using: `sudo nano /etc/nginx/sites-available/default`.

Inside the configuration file, we need to naviagate to the server settings, and modify it as stated below:

```
server {
    listen 80;
    server_name your_app_vm_ip;

    location / {
        proxy_pass http://your_app_server_ip:your_app_port;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```
 Replacing your_app_server_ip with the actual IP address of your app VM and your_app_port with the port where your app is running. In my instance it will now look like this:

 ```server {
    listen 80;
    server_name 34.246.184.57;  # Your public IPv4 address

    location / {
        proxy_pass http://localhost:3000;  # Replace with your app's IP and port if it's on a different server
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

**Save the file** and exit the editor

You *may* need to enable site configuration and can do so using: `sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
`
Before we proceed we should test the nginx configuration, `sudo nginx -t` will let you know if there are any issues. If not restart the system, `sudo systemctl restart nginx
`,  and we should be good to go. 

We have now successfully set up a reverse proxy, and all searches for our public IP will now route us to the port 3000 so we can access our app.

## Research on ports and proxies

### Understanding Ports

**What are ports?** Ports are virtual endpoints in a network. They help distinguish different services on a single device or server. Ports are used to route incoming network requests to the appropriate applications or processes running on a device.

### Reverse Proxy vs. Proxy

**What is a reverse proxy? How is it different from a proxy?** A reverse proxy is a server that sits between client devices and a web server. It acts as an intermediary for client requests and forwards those requests to one or more backend servers. A reverse proxy is used to improve performance, security, and load balancing.

In contrast, a regular proxy (also known as a forward proxy) acts on behalf of clients to access resources from other servers.

![](proxy.png)

### Nginx's Default Configuration

**What is Nginx's default configuration?** Nginx's default configuration is located in the `/etc/nginx/sites-available` directory. This directory contains configuration files for various websites or applications hosted on the Nginx server. These configuration files can be enabled by creating symbolic links to them in the `/etc/nginx/sites-enabled` directory.

### Setting Up Nginx Reverse Proxy

**How do you set up an Nginx reverse proxy?** I provided the steps for setting up an Nginx reverse proxy above. It involves creating or modifying a server block configuration in the `sites-available` directory, configuring Nginx to listen on a specific port, and using the `proxy_pass` function to forward requests to the backend server or application. This allows Nginx to act as a reverse proxy, forwarding requests to the specified backend server based on the URL path.


