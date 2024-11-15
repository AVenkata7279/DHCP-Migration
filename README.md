# DHCP Migration from Domain Controller to Separate Server

This repository contains scripts and instructions for migrating the DHCP role from a Windows Domain Controller to a separate server.

## Why Migrate DHCP?

Moving the DHCP service to a separate server is a best practice for improving network reliability and scalability. It also reduces the load on your Domain Controller.

## Steps for Migration

1. **Backup the current DHCP configuration** on the Domain Controller.
2. **Install DHCP role** on the new server.
3. **Transfer the DHCP configuration** to the new server.
4. **Authorize the new DHCP server** in Active Directory.
5. **Decommission DHCP role** on the Domain Controller.
6. **Verify DHCP functionality** on the new server.

## Prerequisites

- Windows Server version [Specify Version]
- Administrative access to both Domain Controller and the new server
- PowerShell 5.0 or higher

## Scripts

### backup-dhcp.ps1
Exports the current DHCP configuration.

### install-dhcp.ps1
Installs the DHCP role on a new server.

### migrate-dhcp.ps1
Transfers the DHCP configuration from the Domain Controller to the new server.

### decommission-dhcp.ps1
Removes the DHCP role from the Domain Controller.

### test-dhcp.ps1
Tests the new DHCP server to ensure that it is working properly.
