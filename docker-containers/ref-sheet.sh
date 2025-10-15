#-------------------------------------------------------------------------------
#Status

docker ps

#-------------------------------------------------------------------------------
#execute command in docker
sudo docker exec container_name ls


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




