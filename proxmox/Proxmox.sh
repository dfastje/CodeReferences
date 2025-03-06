
#PCI Passthrough
#https://forum.proxmox.com/threads/pci-gpu-passthrough-on-proxmox-ve-8-installation-and-configuration.130218/

#GUI access issue:
#Solution was to modify the vlan mask to match the vlan (like I should have input correctly during the install)

#GUI access issue:
#Setup:
  #I removed a GPU after realizing my mobo does not fully support IOMMU for PCIe passthrough
#Solution:
  #Removing the GPU caused the ports to be renamed from enp7s0 to
  # enp6s0 with similar changes for all other ethernet ports:
  # enp5s0f0 to enp4s0f0
  # enp5s0f1 to enp4s0f1
  #It looks like several other things happened too with removing the PCIe device (HDD modified, ...)
  # Good to know for future setups, but I am going to just do a reinstall as everything is backed up
