sudo apt update && sudo apt upgrade -y
sudo apt install gpg ca-certificates software-properties-common apt-transport-https curl -y
curl -fsSL https://downloads.plex.tv/plex-keys/PlexSign.key \
  | sudo gpg --dearmor -o /usr/share/keyrings/plex.gpg
echo "deb [signed-by=/usr/share/keyrings/plex.gpg] https://downloads.plex.tv/repo/deb public main" \
  | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt update
sudo apt install plexmediaserver -y
sudo systemctl enable --now plexmediaserver
#sudo ufw allow 32400/tcp
