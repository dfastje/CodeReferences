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


#----------------------------------------------------------------- TODO: Finish this section
#Config docker and gui for ollama in Ubuntu WSL

sudo snap install docker

docker run -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama


