#-----------------------------------------------------------------
#Installing WSL & Ubuntu WSL

wsl --install
wsl --status
wsl --update
wsl --list --verbose
wsl --set-default-version 2
wsl --list --online
wsl --install -d Ubuntu

#-----------------------------------------------------------------
#Config of ollama in Ubuntu WSL

curl -fsSL https://ollama.com/install.sh | sh
ollama serve
http://127.0.0.1:11434/
ollama pull llama3.1
ollama run llama3.1
systemctl status ollama


#-----------------------------------------------------------------
#Config nvidia container toolkit

#https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

#----------------------------------------------------------------- TODO: Finish this section
#Config docker and gui for ollama in Ubuntu WSL
sudo snap install docker

sudo docker ps -a
sudo docker rm -v <container id>

#https://github.com/open-webui/open-webui
sudo docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama
sudo docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

sudo docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434  --name open-webui --restart always ghcr.io/open-webui/open-webui:main

sudo docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
#errors out due to gpu lib issue.