$first = read-Host 'First Name:'
$last = read-Host 'Last Name:'
$Description = read-host 'Job Title:'
$Office = read-Host 'Department:'
$Phone = read-Host 'Cell or Extension Number:'
$un = read-Host 'Username:'
$pw = Read-Host -AsSecureString 'Secure Password:'
$Name = $first + ' ' + $last
$homedr = 'X:'
$Homedir = '\server\userdirs\' + $un

connect-msolservice -credential $UserCredential

Write-host "Setting Office 365 Account Password"

if ($Description = "Tech")
{
    Set-MsolUserLicense -UserPrincipalName "$un@cstonemechanical.com" -AddLicenses CapstoneMech:EXCHANGESTANDARD, CapstoneMech:0365_BUSINESS
}
New-MsolUser -DisplayName "$First $Last" -FirstName $First -LastName $Last -UserPrincipalName "$un@cstonemechanical.com" -PasswordNeverExpires $true -UsageLocation US -password $PlainPassword
Set-MsolUserLicense -UserPrincipalName "$un@cstonemechanical.com" -AddLicenses CapstoneMech:O365_BUSINESS, CapstoneMech:EXCHANGESTANDARD
Set-MsolUser -UserPrincipalName "$un@cstonemechanical.com" -StrongPasswordRequired $True



##$ol = New-Object -comObject Outlook.Application

##$mail = $ol.CreateItem(0)
##$Mail.Recipients.Add("Office@cstonemechanical.com")
##$mail.Subject = "Welcome New User $name"
##$mail.Body = "Please welcome our newest user $name.  Attached you will find his contact information that you can double click on and add to your Outlook contacts.  Admin Guy"
##$Mail.Attachments.Add("c:\users\Admin\desktop\$name.vcf")

##$mail.save()

##$inspector = $mail.GetInspector
##$inspector.Display()
##$Mail.send()