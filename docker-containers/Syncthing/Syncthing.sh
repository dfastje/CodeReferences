#Docs:
# https://hub.docker.com/r/linuxserver/syncthing
# https://github.com/linuxserver/docker-syncthing?tab=readme-ov-file


sudo docker compose down
sudo docker compose pull

ST_DATA1_PATH=/media/ubuntuprod/HDD3/syncthing \
ST_DATA1_PATH=/home/ubuntuprod/Syncthing/docker \
sudo docker compose up -d