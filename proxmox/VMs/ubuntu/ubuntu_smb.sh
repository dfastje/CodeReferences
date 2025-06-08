#SMB setup
NAS_IP=""

#-----------------------------------------------------------------------
#Required packages
sudo apt update
sudo apt install cifs-utils

#-----------------------------------------------------------------------
#Directory mount point

if [ ! -d "/mnt/media" ]; then
  sudo mkdir -p /mnt/media
  echo "Directory created."
fi

#-----------------------------------------------------------------------
#Creds file for SMB
CREDS_FILE="/etc/smb-credentials"

if [ ! -f "$CREDS_FILE" ]; then
    echo "Creating SMB credentials file..."
    echo "username=your_smb_username" > "$CREDS_FILE"
    echo "password=your_smb_password" >> "$CREDS_FILE"
    chmod 600 "$CREDS_FILE"
    echo "Credentials file created. Please update with your actual credentials."
else
    echo "Credentials file already exists."
fi

if [ ! -f "$CREDS_FILE" ] || [ ! -r "$CREDS_FILE" ]; then
    echo "Error: Cannot access credentials file."
    exit 1
fi

#-----------------------------------------------------------------------
#Edit /etc/fstab for mounting
if grep -q ' /mnt/media ' /etc/fstab; then
  echo "Mount point already exists in /etc/fstab."
else
  echo "//server/share   /mnt/share   cifs   credentials=/etc/smb-credentials,iocharset=utf8,uid=1000,gid=1000,file_mode=0770,dir_mode=0770,nofail  0  0" >> /
fi
