#Modifying to be able to access Ollama from another origin:
#https://ollama.readthedocs.io/en/faq/?h=port#setting-environment-variables-on-linux
systemctl edit ollama.service

Environment="OLLAMA_HOST=<IP of my VM>"
