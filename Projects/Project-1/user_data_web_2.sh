#!/bin/bash

# Update package list and upgrade packages
apt-get update -y
apt-get upgrade -y

# Install Python3 and curl if not already installed
apt-get install -y python3 curl

# Create a directory to host the website
mkdir -p /var/www/custom-web

# Fetch instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
AMI_ID=$(curl -s http://169.254.169.254/latest/meta-data/ami-id)
INSTANCE_TYPE=$(curl -s http://169.254.169.254/latest/meta-data/instance-type)
PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
AVAILABILITY_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)
REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')

# Create a dynamic HTML file
cat <<EOF > /var/www/custom-web/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to my Terraform Project!</title>
</head>
<body>
  <h1>Hello from Web Server 2!</h1>
  <p>This is a custom web server using Python's built-in HTTP module.</p>

  <h2>Instance Metadata:</h2>
  <ul>
    <li><strong>Instance ID:</strong> $INSTANCE_ID</li>
    <li><strong>AMI ID:</strong> $AMI_ID</li>
    <li><strong>Instance Type:</strong> $INSTANCE_TYPE</li>
    <li><strong>Private IP:</strong> $PRIVATE_IP</li>
    <li><strong>Availability Zone:</strong> $AVAILABILITY_ZONE</li>
    <li><strong>Region:</strong> $REGION</li>
    <li><strong>Hostname:</strong> $HOSTNAME</li>
  </ul>
</body>
</html>
EOF

# Start the web server on port 80 using Python (in the background)
nohup python3 -m http.server 80 --directory /var/www/custom-web &

