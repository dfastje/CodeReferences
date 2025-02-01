#In the future, I might build a file for full vm setup. For now, the scope of this file will be to include the post-install setup steps

#----------------------------------------------------------------------------------------------------------------------
#OpenSSH for remote access
sudo apt install openssh-server

#----------------------------------------------------------------------------------------------------------------------
#Qemu guest agent
sudo apt install qemu-guest-agent
sudo systemctl enable qemu-guest-agent
sudo poweroff
#Enable Options -> Qemu Guest Agent in Proxmox VM settings
#Power on machine
sudo systemctl status qemu-guest-agent

#----------------------------------------------------------------------------------------------------------------------
#Syncthing
sudo apt install syncthing

#----------------------------------------------------------------------------------------------------------------------
#OpenSSH
#https://ubuntu.com/server/docs/openssh-server
sudo apt install openssh-server

#----------------------------------------------------------------------------------------------------------------------
#Mounting SMB network drive
#TODO: figure out access bug between Ubuntu VM and TrueNAS network drive
#https://ubuntu.com/server/docs/how-to-mount-cifs-shares-permanently

#sudo apt-get install cifs-utils
#vi ~/.smbcredentials
##Contents for smb creds file
##  username=<username>
##
##  password=<password>
#chmod 600 ~/.smbcredentials
#----------------------------------------------------------------------------------------------------------------------
#TODO: add UFW