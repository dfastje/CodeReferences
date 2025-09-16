#Not working, but close enough for now

#SMB setup
NAS_IP="192.168.2.171"
NAS_DIR="media"
MNT_DIR="/mnt/${NAS_DIR}"

#-----------------------------------------------------------------------
#Required packages
sudo apt update
sudo apt install cifs-utils

#-----------------------------------------------------------------------
#Directory mount point

if [ ! -d "${MNT_DIR}" ]; then
  sudo mkdir -p "${MNT_DIR}"
  echo "Directory created: ${MNT_DIR}"
else
  echo "Directory already exists: ${MNT_DIR}"
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
echo "input the creds into ${CREDS_FILE}"
if grep -q "your_smb_password" ${CREDS_FILE}; then
  exit 1
fi
#-----------------------------------------------------------------------
#Edit /etc/fstab for mounting
if grep -q " ${MNT_DIR} " /etc/fstab; then
  echo "Mount point already exists in /etc/fstab."
else
  echo "//${NAS_IP}/${NAS_DIR}   ${MNT_DIR}   cifs   credentials=/etc/smb-credentials,iocharset=utf8,uid=1000,gid=1000,file_mode=0770,dir_mode=0770,nofail  0  0" >> /etc/fstab
fi
