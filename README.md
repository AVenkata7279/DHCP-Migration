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

### backup-dhcp
Exports the current DHCP configuration.

### install-dhcp
Installs the DHCP role on a new server.

### migrate-dhcp
Transfers the DHCP configuration from the Domain Controller to the new server.

### decommission-dhcp
Removes the DHCP role from the Domain Controller.

### test-dhcp
Tests the new DHCP server to ensure that it is working properly.
