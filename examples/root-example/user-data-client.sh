#!/bin/bash
# This script is meant to be run in the User Data of each EC2 Instance while it's booting. The script uses the
# run-consul script to configure and start Consul in client mode. Note that this script assumes it's running in an AMI
# built from the Packer template in examples/consul-ami/consul.json.

set -e

# Send the log output from this script to user-data.log, syslog, and the console
# From: https://alestic.com/2010/12/ec2-user-data-output/
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

# These variables are passed in via Terraform template interplation
/opt/consul/bin/run-consul --client --cluster-tag-key "${cluster_tag_key}" --cluster-tag-value "${cluster_tag_value}"

# You could add commands to boot your other apps here

# CAN'T USE DOCKER HUB HOW DO YOU WANT TO AUTHENTICATE.
# sudo apt install docker.io

# Since we can't access docker hub. 
# Should this not be a gateway issue?


# sudo apt install npm

# sudo apt install nodejs-legacy

# npm install

# node consul-service.js &

# sudo mkdir /etc/consul.d

# echo '{"service": {"name": "web", "tags": ["node"], "port": 3000}}' | sudo tee /etc/consul.d/web.json