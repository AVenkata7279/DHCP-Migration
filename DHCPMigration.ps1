
<#
.SYNOPSIS
.This script does require DHCP Modules.
Author: Venkata Krishnaji A
    
.DESCRIPTION
This script is designed to help during Migration of DHCP role from Domain controller to seperate server:
    1. Servers are in same domain
    2. Backup DHCP Configurations
    3. Install DHCP Server Role on New Server
    4. Transfer DHCP Configuration to New Server
    5. Authorize the New DHCP Server
    6. Decommission DHCP on Domain Controller
/dhcp-migration-project
│
├── README.md        # Project overview and instructions
├── backup-dhcp      # Script for backing up DHCP configuration
├── install-dhcp     # Script for installing DHCP on a new server
├── migrate-dhcp     # Script for migrating DHCP configuration
├── decommission     # Script for removing DHCP from the Domain Controller
├── test-dhcp        # Script for testing the new DHCP server
├── LICENSE          # License for the project
└── .gitignore       # Ignore unnecessary files (e.g., backup files)

#>

#///////Accept the input information for the script

# Export DHCP Server Configuration
Export-DhcpServer -ComputerName "DomainController" -Leases -File "C:\Backup\dhcp_config.xml"

# Install DHCP Role on the new server
Install-WindowsFeature -Name DHCP -IncludeManagementTools

# Optionally, configure the DHCP server to be authorized in Active Directory
Add-DhcpServerInDC -DnsName "newdhcpserver.yourdomain.com" -IPAddress "newdhcpserver_ip"

# Import DHCP Configuration
Import-DhcpServer -ComputerName "NewDHCPServer" -File "C:\Backup\dhcp_config.xml" -BackupPath "C:\Backup" -Force

# Authorize DHCP Server in Active Directory
Add-DhcpServerInDC -DnsName "newdhcpserver.yourdomain.com" -IPAddress "newdhcpserver_ip"

# Remove DHCP role from Domain Controller
Uninstall-WindowsFeature -Name DHCP
