#In the future, I might build a file for full vm setup. For now, the scope of this file will be to include the post-install setup steps

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

