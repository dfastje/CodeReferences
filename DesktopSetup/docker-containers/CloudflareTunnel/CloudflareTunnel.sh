#Cloudflare Tunnel

#Add the token after the command
#sudo docker run -d cloudflare/cloudflared:latest tunnel --no-autoupdate run --token

#Couldn't get macvlan to work due to limitations in ubiquiti's unifi
# (I would need to add a second nic to the computer ... probably will in the future)

sudo -E docker compose up -d
