#Rsync was okay, but I did some more research and found Syncthing, which more closely fit my use case
#rsync -r -t -v --progress -s '/media/smoky/16tb/movies' '/run/user/1000/gvfs/smb-share:server=192.168.1.34,share=networkdrive1/'

#rsync -r -t -v --progress -s '/media/smoky/16tb/audiobooks' '/run/user/1000/gvfs/smb-share:server=192.168.1.34,share=networkdrive1/'
