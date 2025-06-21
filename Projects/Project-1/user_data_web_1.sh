#!/bin/bash

apt-get update -y
apt-get install -y python3 curl jq

mkdir -p /var/www/custom-web

# Request IMDSv2 token
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Fetch instance metadata
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AMI_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/ami-id)
INSTANCE_TYPE=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-type)
PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)
AVAILABILITY_ZONE=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)
REGION=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)
HOSTNAME=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/hostname)

# Write HTML
cat <<EOF > /var/www/custom-web/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Welcome to my Terraform Project!</title>
</head>
<body>
  <h1>Hello from Web Server 1..!!</h1>
  <p>This server is running Python's built-in HTTP module.</p>
  <h2>Instance Metadata</h2>
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

# Launch simple HTTP server
nohup python3 -m http.server 80 --directory /var/www/custom-web &
