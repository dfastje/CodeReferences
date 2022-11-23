#### https://help.ubuntu.com/community/Gufw
sudo apt install gufw

###Enable the firewall
sudo ufw enable 
# sudo ufw disable

##HTTP & HTTPS standard rules
sudo ufw allow https
sudo ufw allow http
##SSH rule from local network
sudo ufw allow from 192.168.0.0/16 to any port 22


##Removing lines
# sudo ufw status numbered
sudo ufw delete 6








# 192.168.1.11 80            ALLOW       Anywhere                  
# 192.168.1.11 443           ALLOW       Anywhere                  
# 192.168.1.11 32400         ALLOW       192.168.0.0/16            
# 192.168.1.11 22            ALLOW       192.168.0.0/16 22         
