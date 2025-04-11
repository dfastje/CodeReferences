
#For vbox shared folder access:
#https://askubuntu.com/questions/161759/how-to-access-a-shared-folder-in-virtualbox

sudo docker compose down
sudo docker compose pull

ST_DATA1_PATH=/media/ubuntuprod/HDD3/syncthing \
sudo docker compose up -d
