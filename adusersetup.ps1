start-sleep -s 30 # Giving the DC time to start

$username = "dcadmin"
$pw = ConvertTo-SecureString "p@55w0rd" -AsPlainText -Force

# Create domain admin
New-ADUser -Name "dcadmin" -Description "lab domain admin" -Enabled $true -AccountPassword $pw
Add-ADGroupMember -Identity "Domain Admins" -Members dcadmin

# Create "Sales" group and add sales user
New-ADGroup -Name "Sales" -SamAccountName Sales `
    -GroupCategory Security `
    -GroupScope Global `
    -DisplayName "Sales Team" `
    -Path "CN=Users,DC=contoso,DC=local" `
    -Description "Members of the Sales Team"

New-ADUser -Name "adsales" -Description "sales team member" -Enabled $true -AccountPassword $pw
Add-ADGroupMember -Identity "Sales" -Members adsales
