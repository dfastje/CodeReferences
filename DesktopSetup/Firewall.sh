#Assumption: This script is written for local access ONLY.
 # In the distant future I will configure a solution for external hosting ... but I am not setup for that yet and am using a home VPN if needed.

#### https://help.ubuntu.com/community/Gufw


##Config Variables --------------------------------------------------------------------------------------------------------------------
LOCAL_IP_RANGE='192.168.0.0/16'

##Install -----------------------------------------------------------------------------------------------------------------------------
#sudo apt install gufw

##Enable/Disable the firewall ---------------------------------------------------------------------------------------------------------
sudo ufw enable
# sudo ufw disable

##HTTP & HTTPS standard rules ---------------------------------------------------------------------------------------------------------
sudo ufw allow from $LOCAL_IP_RANGE to any port 443
sudo ufw allow from $LOCAL_IP_RANGE to any port 80
##SSH rule from local network ---------------------------------------------------------------------------------------------------------
sudo ufw allow from $LOCAL_IP_RANGE to any port 22
##RDP ports for remote control from local network ------------------------------------------------------------------------
#https://www.webune.com/forums/what-port-does-rdp-uses-remote-desktop-protocol.html
sudo ufw allow from $LOCAL_IP_RANGE to any port 3389
#sudo ufw allow from any to any port 3390 #I DO NOT WANT EXTERNAL LOGINS
##Plex ports from local network ---------------------------------------------------------------------------------------------------------------------
#https://support.plex.tv/articles/201543147-what-network-ports-do-i-need-to-allow-through-my-firewall/
sudo ufw allow from $LOCAL_IP_RANGE to any port 32400
#Additional Ports are not recommended by Plex. Here for completeness, but don't use them.
#sudo ufw allow from $LOCAL_IP_RANGE to any port 1900
#sudo ufw allow from $LOCAL_IP_RANGE to any port 5353
#sudo ufw allow from $LOCAL_IP_RANGE to any port 8324
#sudo ufw allow from $LOCAL_IP_RANGE to any port 32410
#sudo ufw allow from $LOCAL_IP_RANGE to any port 32412
#sudo ufw allow from $LOCAL_IP_RANGE to any port 32413
#sudo ufw allow from $LOCAL_IP_RANGE to any port 32414
#sudo ufw allow from $LOCAL_IP_RANGE to any port 32469
##NAS drive from local network ---------------------------------------------------------------------------------------------------------------------
#https://www.upguard.com/blog/smb-port
sudo ufw allow from $LOCAL_IP_RANGE to any port 445
sudo ufw allow from $LOCAL_IP_RANGE to any port 139
##Nextcloud from local network ---------------------------------------------------------------------------------------------------------------------
#https://www.upguard.com/blog/smb-port
sudo ufw allow from $LOCAL_IP_RANGE to any port 444
sudo ufw allow from $LOCAL_IP_RANGE to any port 81
##Removing lines ----------------------------------------------------------------------------------------------------------------------
#sudo ufw status numbered
#sudo ufw delete 1
#sudo ufw reset








# 192.168.1.11 80            ALLOW       Anywhere                  
# 192.168.1.11 443           ALLOW       Anywhere                  
# 192.168.1.11 32400         ALLOW       192.168.0.0/16            
# 192.168.1.11 22            ALLOW       192.168.0.0/16 22         


#[ 1] 192.168.1.11 80            ALLOW IN    Anywhere
#[ 2] 192.168.1.11 443           ALLOW IN    Anywhere
#[ 3] 192.168.1.11 32400         ALLOW IN    192.168.0.0/16
#[ 4] 192.168.1.11 22            ALLOW IN    192.168.0.0/16 22
#[ 5] 80/tcp                     ALLOW IN    Anywhere
#[ 6] 192.168.1.11 22            ALLOW IN    192.168.0.0/16
#[ 7] 80/tcp (v6)                ALLOW IN    Anywhere (v6)