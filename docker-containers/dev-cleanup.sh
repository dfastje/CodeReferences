#-------------------------------------------------------------------------------
#Clean up env for dev:

#Remove all existing containers for clean dev
# shellcheck disable=SC2046
sudo docker rm -f $(sudo docker ps -aq)
#Remove unused images:
#sudo docker image prune -a
#Remove unused volumes:
#sudo docker volume prune
#Remove unused networks:
#sudo docker network prune