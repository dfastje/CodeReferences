#Docs:
# https://hub.docker.com/r/linuxserver/syncthing
# https://github.com/linuxserver/docker-syncthing?tab=readme-ov-file

#Params:
#ENV_DATA1_PATH: path to media files with source of truth elsewhere
#ENV_DATA2_PATH: path to docker config volumes to backup
#ENV_DATA3_PATH: path to syncthing files with source of truth on this machine

sudo docker compose down
sudo docker compose pull
sudo docker compose up -d