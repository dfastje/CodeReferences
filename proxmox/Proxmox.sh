
#PCI Passthrough
#https://forum.proxmox.com/threads/pci-gpu-passthrough-on-proxmox-ve-8-installation-and-configuration.130218/

#GUI access issue:
#Issue: rebooted proxmox after modifying the vlan mask to match network (with typo)
#Solution: modify the vlan mask to match the vlan in the interfaces file
#   /etc/network/interfaces (traditional debian style)
#   (like I should have input correctly during the install)

#GUI access issue 2:
#Issue: removed nic1&2 to put nic1&2 in desktop with PCI pass through support.
#   Verified access over Static IP assigned to remaining nic0 in system
#   (to support VM network isolation)
#Failed Solution: update /etc/hosts to reflect Static IP address of remaining nic0
#Solution: remove the removed nic1&2 from /etc/network/interfaces
