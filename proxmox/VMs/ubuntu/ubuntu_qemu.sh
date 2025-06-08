#Qemu guest agent
sudo apt install qemu-guest-agent
sudo systemctl enable qemu-guest-agent
sudo poweroff
#Enable Options -> Qemu Guest Agent in Proxmox VM settings
#Power on machine
sudo systemctl status qemu-guest-agent
