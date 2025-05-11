#Installing Portainer for the first time on a machine
#https://docs.portainer.io/start/install-ce
# https://docs.portainer.io/start/install-ce/server/docker
#   https://docs.portainer.io/start/install-ce/server/docker/linux
#Access: https://localhost:9443


#sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

sudo docker compose down
sudo docker compose pull
sudo docker compose up -d