sudo apt install docker.io
#Install whaler flatpak

#Add needed access rights to user to access docker without sudo
#https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
