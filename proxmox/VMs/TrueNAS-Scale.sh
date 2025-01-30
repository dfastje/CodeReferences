
#TrueNAS Scale
#Most of the configs are setup in the GUI. (If I find myself reinstalling TrueNAS alot, I'll script them)

#Steps
#1) Remove access to admin control panel from hosting network by changing "Allowed IP Addresses"
#2) Add MFA
#3) Create dataset based on virtual drives
#4) Create users & groups for all use cases
#5) Create Dataset for Containers
#6) Create Dataset for shared data
#7) Install Syncthing
#8) Config Syncthing through TrueNAS's gui access
#9) Update access rights to dataset for shared data
#10) Grant Syncthing mounted drive to shared data dataset
#11) Syncthing is using a custom port on TrueNAS so the autodetect won't work. Manually config
