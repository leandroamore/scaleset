#!/bin/bash
#sudo yum install -y epel-release
#sudo yum update
#sudo yum install -y stress
#crontab -l > mycron si quisiera conservar los crons
wget ftp://fr2.rpmfind.net/linux/dag/redhat/el7/en/x86_64/dag/RPMS/stress-1.0.2-1.el7.rf.x86_64.rpm 
sudo yum localinstall stress-1.0.2-1.el7.rf.x86_64.rpm -y
echo "5 * * * * /usr/bin/stress -t 1800 -c 4" > mycron
crontab mycron
stress -t 900 -c 2
