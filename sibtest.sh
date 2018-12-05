
#!/bin/bash

sudo yum update
#creo carpetas y symbolic links
sudo mkdir /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/vuonboarding/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/vudocumentprocessor/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/portal-autogestion/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/api-manager-rest/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/nginx/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/tomcat-backend/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/tomcat-frontend/ /mnt/shared/modernizacion/test/log/$HOSTNAME
#reemplazo node.conf
sudo sed -i 's/Default 9/default '$HOSTNAME'/gi' /mnt/shared/modernizacion/test/api-gateway/nginx/node.conf

sudo cd /mnt/shared/modernizacion/test
sudo docker-compose  pull --include-deps
sudo docker-compose -f /mnt/shared/modernizacion/test/docker-compose.yml up -d
