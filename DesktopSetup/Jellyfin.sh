#This script should not be run directly.
exit 1

#https://jellyfin.org/downloads/server
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash


#Once installed, Jellyfin will be running as a service. Manage it with
 sudo systemctl {action} jellyfin.service
# or
 sudo service jellyfin {action}.

#Contact:

#http://:8096