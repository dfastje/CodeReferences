#Cloudflare Tunnel

#Add the token after the command
#sudo docker run -d cloudflare/cloudflared:latest tunnel --no-autoupdate run --token

#Couldn't get macvlan to work due to limitations in ubiquiti's unifi
# (I would need to add a second nic to the computer ... probably will in the future)

export TUNNEL_TOKEN=eyJhIjoiMjBiNzE0ODc4MzJhYmNmMjNiNzNhZTZlNDRlNTBiN2QiLCJ0IjoiNmFhZWQyZWMtZjc1Yi00ZDg2LThlNDUtNzcwMjJhM2RjMTg2IiwicyI6IllXWXhNbVUzWmpjdE5EbGhaUzAwTmpneUxUZ3pZakl0WXpOaFpqUmxPREF3T0RndyJ9

sudo -E docker compose up -d
