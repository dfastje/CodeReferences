#Install
#  https://ollama.readthedocs.io/en/quickstart/#linux


#Accessing from another machine:
#TODO: modify this to use SSL through a proxy
#  https://ollama.readthedocs.io/en/faq/?h=port#how-can-i-allow-additional-web-origins-to-access-ollama
#  https://ollama.readthedocs.io/en/faq/?h=port#how-do-i-configure-ollama-server
#  https://ollama.readthedocs.io/en/faq/?h=port#how-do-i-use-ollama-behind-a-proxy
  sudo systemctl edit ollama

    #Add these lines to the top section
    # [Service]
    # Environment="OLLAMA_HOST=0.0.0.0:11434"

  #Verify changes here
  cat /etc/systemd/system/ollama.service.d/override.conf

  #Apply the changes:
  systemctl daemon-reexec
  systemctl daemon-reload
  systemctl restart ollama
