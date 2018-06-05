#!/bin/bash
sudo yum install -y epel-release
sudo yum install -y stress

while [ 1=1 ]
do
        stress -c 2 -t 600
        sleep 10m
        echo "corrida" >> /home/adminprisma/log.txt
done
