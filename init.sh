#!/bin/bash
sudo yum install -y epel-release
sudo yum install -y stress
#crontab -l > mycron si quisiera conservar los crons
echo "5 * * * * /usr/bin/stress -t 1800 -c 2" > mycron
crontab mycron
stress -t 900 -c 2
