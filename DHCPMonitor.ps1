Import-Module DhcpServer 
 
$a = "" 
$a = $a + "BODY{background-color:White;font-family: Arial; font-size: 10pt;}" 
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}" 
$a = $a + "TH{border-width: 1px;padding: 5px;border-style: solid;border-color: black;background-color:silver}" 
$a = $a + "TD{border-width: 1px;padding: 5px;border-style: solid;border-color: black;background-color:WhiteSmoke}" 
$a = $a + "" 
 
$DHCPStats = @() 
$DHCPStatsString = @() 
 
Get-DhcpServerInDC | foreach-object { 
$DHCPSrvr = $_.Server  
Get-DhcpServerv4Scope -ComputerName PONDC02.christies.com |where {$_.State -eq 'Active'}|ForEach-Object { 
$ScopeName = $_.Name 
$ScopeID = $_.ScopeID 
$SM = $_.SubnetMask 
$Start = $_.StartRange 
$End = $_.EndRange 
$Lease = $_.LeaseDuration 
$State = $_.State 
$IPFree = (Get-DhcpServerv4ScopeStatistics -ComputerName FQDN.Domain.com -ScopeID $ScopeID).Free 
$IPInuse = (Get-DhcpServerv4ScopeStatistics -ComputerName FQDN.Domain.com -ScopeID $ScopeID).Inuse 
$DHCPStats = New-Object -TypeName PSObject 
$DHCPStats | Add-Member -MemberType NoteProperty -Name ScopeName -Value $ScopeName 
$DHCPStats | Add-Member -MemberType NoteProperty -Name ScopeNetwork -Value $ScopeID 
$DHCPStats | Add-Member -MemberType NoteProperty -Name FreeIPs -Value $IPFree 
$DHCPStats | Add-Member -MemberType NoteProperty -Name DHCPServer -Value $DHCPSrvr 
$DHCPStats | Add-Member -MemberType NoteProperty -Name IPsInUse -Value $IPInuse 
$DHCPStats | Add-Member -MemberType NoteProperty -Name Start -Value $Start 
$DHCPStats | Add-Member -MemberType NoteProperty -Name End -Value $End 
$DHCPStatsString += $DHCPStats 
} 
} 
$DHCPStatsBody = $DHCPStatsString|Select ScopeName, ScopeNetwork, DHCPServer, FreeIPs, IPsInUse, Start, End|Sort-object FreeIPs|ConvertTo-HTML -Head $a -Body "<H2>DHCP Server Statistics</H2>" 
$body = "<font face='arial'> " 
$body += "`n" 
$body += $DHCPStatsBody 
$body += "`n" 
 
Send-MailMessage -From "DHCP@christies.com" -To "vkarigela@christies.com" -Subject "DHCP Scope Statistics" -Body "$body" -BodyAsHtml -SmtpServer "mail.christies.com"
