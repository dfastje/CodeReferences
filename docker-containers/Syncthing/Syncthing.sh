#Docs:
# https://hub.docker.com/r/linuxserver/syncthing
# https://github.com/linuxserver/docker-syncthing?tab=readme-ov-file

#Params:
#SYNCTHING: files owned by other machines
#SYNCTHING_LOCAL: files owned by this machine


sudo docker compose down
sudo docker compose pull
sudo docker compose up -d