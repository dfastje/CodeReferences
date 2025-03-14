#Cloudflare Tunnel

#Add the token after the command
#sudo docker run -d cloudflare/cloudflared:latest tunnel --no-autoupdate run --token

#Couldn't get macvlan to work due to limitations in ubiquiti's unifi
# (I would need to add a second nic to the computer ... probably will in the future)


sudo docker compose down
sudo docker compose pull
sudo docker compose up -d


#Errors:
#  If you see:
#    WARN[0000] The "TUNNEL_TOKEN" variable is not set. Defaulting to a blank string.
#  You are missing the docker compose .env file