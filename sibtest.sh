
#!/bin/bash

#sudo yum update
#creo carpetas y symbolic links
echo "Creando Symbolic Links"
sudo mkdir /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/vuonboarding/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/vudocumentprocessor/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/portal-autogestion/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/api-manager-rest/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/nginx/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/tomcat-backend/ /mnt/shared/modernizacion/test/log/$HOSTNAME
sudo ln -s /var/log/tomcat-frontend/ /mnt/shared/modernizacion/test/log/$HOSTNAME
#reemplazo node.conf
echo "Cambiando config de node.conf"
sudo sed -i 's/Default 9/default '$HOSTNAME'/gi' /mnt/shared/modernizacion/test/api-gateway/nginx/node.conf
#configuro swap en la imagen
echo "Modificando /etc/waagent.conf"
sudo sed -i 's/ResourceDisk.EnableSwap=n/ResourceDisk.EnableSwap=y/g' /etc/waagent.conf
sudo sed -i 's/ResourceDisk.Format=n/ResourceDisk.Format=y/g' /etc/waagent.conf
sudo sed -i 's/ResourceDisk.SwapSizeMB=0/ResourceDisk.SwapSizeMB=4096/g' /etc/waagent.conf



echo "levantando dockers"
sudo docker-compose -f /mnt/shared/modernizacion/test/docker-compose.yml up -d
echo "reiniciando el servicio de Waagent"
sudo systemctl restart waagent.service
