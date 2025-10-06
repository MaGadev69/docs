sudo docker ps -a

# Detener y eliminar el contenedor
sudo docker stop postgredb
sudo docker rm postgredb

# Eliminar el volumen de datos
sudo rm -rf /home/ubuntu/postgres_data

# (Opcional) Eliminar la imagen de PostgreSQL
sudo docker rmi postgres:latest


sudo reboot
