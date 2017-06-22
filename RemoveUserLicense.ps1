$first = Read-Host 'First Name'
$last = Read-host 'Last Name'
$ua = Read-Host 'Username'
$UserCredential = Get-Credential

Connect-MsolService -Credential $UserCredential
Set-MsolUserLicense -UserPrincipalName "$un@cstonemechanical.com" -RemoveLicenses CapstoneMech:O365_EXCHANGEDESKLESS
Set-MsolUserLicense -UserPrincipalName "$un@cstonemechanical.com" -RemoveLicenses CapstoneMech:O365_BUSINESS