#!/bin/bash

# Update package list and upgrade packages
apt-get update -y
apt-get upgrade -y

# Install Python3 if not already installed
apt-get install -y python3

# Create a directory to host the website
mkdir -p /var/www/custom-web

# Create a basic HTML file
cat <<EOF > /var/www/custom-web/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to my Terraform Project !!</title>
</head>
<body>
  <h1>Hello from web server 1 ..!!</h1>
  <p>This is a custom web server using Python's built-in HTTP module.</p>
</body>
</html>
EOF

# Start the web server on port 80 using Python (in the background)
nohup python3 -m http.server 80 --directory /var/www/custom-web &


