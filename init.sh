#!/bin/bash
sudo yum install -y epel-release
sudo yum install -y stress
crontab -l > mycron
echo "*/2 * * * * /usr/bin/stress -t 60 -c 2" >> mycron
crontab mycron
