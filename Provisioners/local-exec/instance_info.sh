#!/bin/bash

public_ip=$1
private_ip=$2

echo "Public IP of EC2 Instance is: ${public_ip}" >> Server_IP.txt
echo "Private IP of EC2 Instance is: ${private_ip}" >> Server_IP.txt

echo " Script executed successfully..!!"

