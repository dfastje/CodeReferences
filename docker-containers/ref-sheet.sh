#-------------------------------------------------------------------------------
#Status

docker ps

#-------------------------------------------------------------------------------
#Clean up env for dev:

#Remove all existing containers for clean dev
sudo docker rm -f "$(sudo docker ps -aq)"
#Remove unused images:
docker image prune -a
#Remove unused volumes:
sudo docker volume prune
#Remove unused networks:
sudo docker network prune
#-------------------------------------------------------------------------------
#Network: https://docs.docker.com/reference/cli/docker/network/
docker network ls

docker network inspect

ip link show

#-------------------------------------------------------------------------------
#Container:
# https://docs.docker.com/reference/cli/docker/container/
docker container
# https://docs.docker.com/reference/cli/docker/container/run/
docker container run


#-------------------------------------------------------------------------------
#Compose
sudo docker compose up -d
sudo docker compose down




