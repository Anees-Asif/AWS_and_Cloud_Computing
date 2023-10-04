#!/bin/bash

# Get the public IP address
public_ip=$(curl -s https://api64.ipify.org?format=text)

# Check if the public IP was obtained successfully
if [ -n "$public_ip" ]; then
    echo "Public IP address: $public_ip"
else
    echo "Failed to retrieve the public IP address. Exiting."
    exit 1
fi

# Create an Nginx server block configuration file for reverse proxy
sudo tee /etc/nginx/sites-available/my_node_app > /dev/null <<EOL
server {
    listen 80;
    server_name $public_ip; # Use the obtained public IP address

    location / {
        proxy_pass http://localhost:3000; # Replace with your app's IP and port if it's on a different server
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }

    # Additional Nginx configuration if needed
}
EOL

# Create a symbolic link to enable the site configuration
sudo ln -s /etc/nginx/sites-available/my_node_app /etc/nginx/sites-enabled/

# Test the Nginx configuration
sudo nginx -t

# If the configuration test is successful, restart Nginx to apply the changes
sudo systemctl restart nginx
