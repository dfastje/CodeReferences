######## Install ##################################################################

# https://nextcloud.com/install/ -> Snap package
# https://snapcraft.io/install/nextcloud/ubuntu
#sudo apt list --installed | grep nextcloud
sudo snap install nextcloud

######## Setup ##################################################################
#Access http://localhost:80
#input initial admin creds


######## Configs ##################################################################
# https://github.com/nextcloud-snap/nextcloud-snap



# Removeable media------------------------------------
# https://github.com/nextcloud-snap/nextcloud-snap/wiki/Change-data-directory-to-use-another-disk-partition
sudo snap connect nextcloud:removable-media


# Monitoring network hardware - might need for network drives
# sudo snap connect nextcloud:network-observe



# HTTP & HTTPS ----------------------------------------
##Self signed cert SSL
sudo nextcloud.enable-https self-signed
sudo snap set nextcloud ports.http=81
sudo snap set nextcloud ports.https=444
##Valid cert SSL
# sudo nextcloud.enable-https lets-encrypt

# sudo snap set nextcloud ports.http=81 ports.https=444

##Setting the allowed domains:
sudo nextcloud.occ config:system:set trusted_domains 2 --value=192.168.1.11
# sudo nextcloud.occ config:system:set trusted_domains 3 --value=my.domain
sudo nextcloud.occ config:system:get trusted_domains 