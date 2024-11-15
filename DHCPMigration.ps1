
<#
.SYNOPSIS
Migrating DHCP from Domain controller to seperate server
Export-DhcpServer is a Windows PowerShell script that 
Author: Eric Kuehn
    
.DESCRIPTION
This script is designed to help during the Mapping phase of a penetration test.  It does require a valid set of credentials from the Active Directory Domain being searched.  Once it connects, it goes through the following process:
    1. All Domain Level objects, containers, and OUs in a Domain
    2. The permissions assigned to the OU
    3. If the permissions are different than the parent object
    4. Exports a list of the permissions
.PARAMETER ADDomain
The fully qualified DNS name of the Domain to search
.PARAMETER NoCredentials
Do not prompt for a set of credentials to use to bind to Active Directory
.PARAMETER ComputerDomain
Do not prompt for the name of an Active Directory Domain and instead use the computer's Domain.
.EXAMPLE
Invoke-FindOuPermissions
Starts the information gathering with default settings: Prompt for a Domain, a set of crednetials, and query the entire Forest.
.EXAMPLE
Invoke-FindOuPermissions -LocalCredentials -ComputerDomain
Starts the inormation gathering using the current credentials and the Domain the computer is a member of.
.NOTES
1. Valid credentials are needed to bind to the Active Directory Domain.
#>

#///////Accept the input information for the script
